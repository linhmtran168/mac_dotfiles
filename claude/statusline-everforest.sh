#!/usr/bin/env bash
#
# Everforest Dark Status Line for Claude Code
#
# Reads JSON from stdin, outputs a responsive status bar.
# Layout adapts to terminal width — segments wrap to new lines
# when they would exceed the available columns.
#
# Row 1: Model | Directory | Git branch + status
# Row 2: Context bar | 5h session bar (+ reset) | 7d weekly bar (+ reset)
# Row 3: Elapsed time | Session cost
#
# Dependencies: jq, git, awk, date (macOS BSD)
# Icons require a Nerd Font patched terminal font.
#

set -f # disable globbing — safe for IFS='/' splitting on paths

input=$(cat)

# ─────────────────────────────────────────────────────────────────────
# Terminal width
#
# $COLUMNS is a shell variable (not exported), so child processes
# don't inherit it. In piped contexts (statusline), tput also fails
# because stdout isn't a terminal. We query /dev/tty directly.
# ─────────────────────────────────────────────────────────────────────
detect_width() {
  # 1. Inherited $COLUMNS (works if explicitly exported)
  [[ -n "${COLUMNS:-}" ]] && ((COLUMNS > 0)) && { echo "$COLUMNS"; return; }
  # 2. Query controlling terminal via /dev/tty (most reliable in pipes)
  local w
  w=$(stty size </dev/tty 2>/dev/null | awk '{print $2}')
  [[ -n "$w" ]] && (($w > 0)) && { echo "$w"; return; }
  # 3. tput fallback
  w=$(tput cols 2>/dev/null)
  [[ -n "$w" ]] && (($w > 0)) && { echo "$w"; return; }
  # 4. Safe default for modern wide terminals
  echo 200
}
cols=$(detect_width)

# ─────────────────────────────────────────────────────────────────────
# Everforest Dark TrueColor palette
# ─────────────────────────────────────────────────────────────────────
GREEN=$'\033[38;2;166;180;101m'
BLUE=$'\033[38;2;127;187;179m'
YELLOW=$'\033[38;2;219;188;127m'
RED=$'\033[38;2;230;126;128m'
TEXT=$'\033[38;2;211;198;170m'
DIM=$'\033[38;2;133;146;137m'
RESET=$'\033[0m'

SEP="${DIM} | ${RESET}"

# ─────────────────────────────────────────────────────────────────────
# Nerd Font icons — raw UTF-8 byte sequences
#
# macOS ships bash 3.2 which does NOT support $'\uNNNN'.
# We use $'\xNN' ANSI-C quoting to embed exact UTF-8 bytes.
# ─────────────────────────────────────────────────────────────────────
ICO_TERM=$'\xee\x9c\x88'      # U+E708  nf-dev-terminal
ICO_DIR=$'\xef\x81\xbb'       # U+F07B  nf-fa-folder
ICO_GIT=$'\xee\x82\xa0'       # U+E0A0  nf-pl-branch
ICO_BRAIN=$'\xf3\xb0\xa7\x91' # U+F09D1 nf-md-brain
ICO_BOLT=$'\xef\x83\xa7'      # U+F0E7  nf-fa-bolt
ICO_CAL=$'\xef\x81\xb3'       # U+F073  nf-fa-calendar
ICO_TIME=$'\xef\x80\x97'      # U+F017  nf-fa-clock_o
ICO_COST=$'\xef\x83\x96'      # U+F0D6  nf-fa-money
ICO_RST=$'\xef\x80\xa1'       # U+F021  nf-fa-refresh

# ─────────────────────────────────────────────────────────────────────
# Visible width — strip ANSI escape codes, return character count
# Pure bash loop, no subshells.
# ─────────────────────────────────────────────────────────────────────
_ansi_re=$'\033\\[[0-9;]*m'
vw() {
  local s="$1"
  while [[ "$s" =~ $_ansi_re ]]; do
    s="${s/${BASH_REMATCH[0]}/}"
  done
  echo "${#s}"
}

# ─────────────────────────────────────────────────────────────────────
# Emit a row of segments, wrapping at terminal width
#
# Segments are joined with " | ". When appending the next segment
# would exceed $cols, it starts a new output line instead.
# ─────────────────────────────────────────────────────────────────────
_sep_w=$(vw "$SEP")
emit_row() {
  local line="" w=0 first=1
  for seg in "$@"; do
    local sw
    sw=$(vw "$seg")
    if ((first)); then
      line="$seg"; w="$sw"; first=0
    elif ((w + _sep_w + sw <= cols)); then
      line+="${SEP}${seg}"; ((w += _sep_w + sw))
    else
      printf '%s\n' "$line"
      line="$seg"; w="$sw"
    fi
  done
  [[ -n "$line" ]] && printf '%s\n' "$line"
}

# ─────────────────────────────────────────────────────────────────────
# Progress bar — 10-char wide, result stored in global $_bar
#
# Args: $1=percentage (int, -1 for N/A), $2=ANSI color
# Output: [██████░░░░] 60%  or  [░░░░░░░░░░] N/A
# ─────────────────────────────────────────────────────────────────────
_bar=""
progress_bar() {
  local pct="$1" color="$2"
  if [[ "$pct" == "-1" ]]; then
    _bar="${DIM}[░░░░░░░░░░] N/A${RESET}"
    return
  fi
  local filled=$((pct * 10 / 100))
  ((filled > 10)) && filled=10
  local empty=$((10 - filled)) bar=""
  for ((i = 0; i < filled; i++)); do bar+="█"; done
  for ((i = 0; i < empty; i++)); do bar+="░"; done
  _bar="${color}[${bar}] ${pct}%${RESET}"
}

# ═════════════════════════════════════════════════════════════════════
# DATA — Parse JSON and compute display values
# ═════════════════════════════════════════════════════════════════════

# Single jq call extracts all fields with @sh quoting for safe eval
eval "$(echo "$input" | jq -r '
  "model_raw="   + (.model.display_name             // "Unknown" | @sh),
  "cwd="         + (.workspace.current_dir // .cwd   // "?"      | @sh),
  "used_pct="    + (.context_window.used_percentage  // -1 | floor | tostring),
  "five_pct="    + (.rate_limits.five_hour.used_percentage  // -1 | floor | tostring),
  "week_pct="    + (.rate_limits.seven_day.used_percentage  // -1 | floor | tostring),
  "five_reset="  + (.rate_limits.five_hour.resets_at // -1 | tostring),
  "week_reset="  + (.rate_limits.seven_day.resets_at // -1 | tostring),
  "total_cost="  + (.cost.total_cost_usd             // 0  | tostring),
  "transcript_path=" + (.transcript_path             // "" | @sh)
')"

# ── Model name ──
# "Claude Opus 4.6 (1M context)" → "Opus 4.6 1M"
model_name="${model_raw#Claude }"
model_name="${model_name/ context)/}"
model_name="${model_name/ Context)/}"
model_name="${model_name/(/}"
model_name="${model_name/  / }"
model_name="${model_name% }"

# ── Directory — fish-style shortened path ──
# ~/Dev/github/project    → ~/D/g/project     (≤3 intermediates: abbreviate)
# ~/a/b/c/d/e/project     → ~/a/../e/project  (>3 intermediates: collapse)
short_path() {
  local raw="$1"
  [[ "$raw" == "$HOME" ]] && { echo "~"; return; }
  [[ "$raw" == "$HOME/"* ]] && raw="~${raw#$HOME}"

  local IFS='/'
  local parts=($raw)
  local n=${#parts[@]}
  ((n <= 1)) && { echo "${parts[*]}"; return; }

  local last="${parts[$((n - 1))]}"
  local prefix="${parts[0]}"
  local mid=$((n - 2)) # intermediate directory count

  if ((mid <= 3)); then
    local result="$prefix"
    for ((i = 1; i < n - 1; i++)); do
      result+="/${parts[$i]:0:1}"
    done
    echo "${result}/${last}"
  else
    echo "${prefix}/${parts[1]:0:1}/../${parts[$((n - 2))]:0:1}/${last}"
  fi
}
short_cwd=$(short_path "$cwd")

# ── Context bar color — green → yellow → red as usage grows ──
ctx_color="$GREEN"
if [[ "$used_pct" != "-1" ]]; then
  ((used_pct >= 75)) && ctx_color="$RED"
  ((used_pct >= 50 && used_pct < 75)) && ctx_color="$YELLOW"
fi

# ── Rate limit reset times — epoch → "MM/DD HH:mm" local time ──
five_reset_fmt=""
[[ "$five_reset" != "-1" && -n "$five_reset" ]] &&
  five_reset_fmt=$(date -r "$five_reset" "+%m/%d %H:%M" 2>/dev/null)
week_reset_fmt=""
[[ "$week_reset" != "-1" && -n "$week_reset" ]] &&
  week_reset_fmt=$(date -r "$week_reset" "+%m/%d %H:%M" 2>/dev/null)

# ── Git — branch name + per-type change counts ──
# Porcelain format: XY filename (X=index, Y=worktree)
# Counters: +N staged, !N modified, ✘N deleted, ?N untracked
if git_branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null); then
  ((${#git_branch} > 30)) && git_branch="${git_branch:0:29}…"

  porcelain=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" status --porcelain 2>/dev/null)
  if [[ -n "$porcelain" ]]; then
    read -r stg mod unt del <<< "$(echo "$porcelain" | awk '
      /^\?\?/ { u++; next }
      {
        x = substr($0, 1, 1); y = substr($0, 2, 1)
        if (x ~ /[MADRC]/) s++
        if (y == "M") m++
        if (y == "D" || x == "D") d++
      }
      END { print s+0, m+0, u+0, d+0 }')"

    git_stats=""
    ((stg > 0)) && git_stats+="${GREEN}+${stg}${RESET} "
    ((mod > 0)) && git_stats+="${YELLOW}!${mod}${RESET} "
    ((del > 0)) && git_stats+="${RED}✘${del}${RESET} "
    ((unt > 0)) && git_stats+="${DIM}?${unt}${RESET} "
    git_part="${RED}${ICO_GIT} ${git_branch}${RESET} ${git_stats%% }"
  else
    git_part="${GREEN}${ICO_GIT} ${git_branch}${RESET}"
  fi
else
  git_part="${DIM}${ICO_GIT} no git${RESET}"
fi

# ── Elapsed time — readable format from transcript birth-time ──
elapsed="0s"
if [[ -n "$transcript_path" && -f "$transcript_path" ]]; then
  btime=$(stat -f %B "$transcript_path" 2>/dev/null)
  [[ -z "$btime" || "$btime" == "0" ]] &&
    btime=$(stat -f %c "$transcript_path" 2>/dev/null)
  now=$(date +%s)
  if [[ -n "$btime" && "$btime" -gt 0 && "$now" -ge "$btime" ]]; then
    d=$((now - btime))
    if ((d < 60)); then elapsed="${d}s"
    elif ((d < 3600)); then elapsed="$((d / 60))m $((d % 60))s"
    else elapsed="$((d / 3600))h $(((d % 3600) / 60))m"
    fi
  fi
fi

# ── Session cost — directly from the API ──
cost_str="N/A"
if [[ -n "$total_cost" && "$total_cost" != "0" ]]; then
  cost_str=$(awk "BEGIN { printf \"\$%.4f\", $total_cost }")
fi

# ═════════════════════════════════════════════════════════════════════
# RENDER — Assemble segments and emit with responsive wrapping
# ═════════════════════════════════════════════════════════════════════

seg_model="${BLUE}${ICO_TERM} ${model_name}${RESET}"
seg_dir="${YELLOW}${ICO_DIR} ${short_cwd}${RESET}"

progress_bar "$used_pct" "$ctx_color"
seg_ctx="${ctx_color}${ICO_BRAIN}${RESET} ${_bar}"

progress_bar "$five_pct" "$BLUE"
seg_5h="${BLUE}${ICO_BOLT}${RESET} ${_bar}"
[[ -n "$five_reset_fmt" ]] && seg_5h+=" ${DIM}${ICO_RST} ${five_reset_fmt}${RESET}"

progress_bar "$week_pct" "$YELLOW"
seg_7d="${YELLOW}${ICO_CAL}${RESET} ${_bar}"
[[ -n "$week_reset_fmt" ]] && seg_7d+=" ${DIM}${ICO_RST} ${week_reset_fmt}${RESET}"

seg_time="${TEXT}${ICO_TIME} ${elapsed}${RESET}"
seg_cost="${GREEN}${ICO_COST} ${cost_str}${RESET}"

emit_row "$seg_model" "$seg_dir" "$git_part"
emit_row "$seg_ctx" "$seg_5h" "$seg_7d"
emit_row "$seg_time" "$seg_cost"
