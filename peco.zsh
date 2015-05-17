##
# Peco
##
# Peco for repo
function peco-src () {
  local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}

zle -N peco-src
bindkey '^]' peco-src

# peco for history
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# peco for git
function git-hash() {
  # git log --oneline --branches --decorate=full | peco | awk '{print $1}'
  git lg | peco | sed -e "s/^[\*\|][ |\\\/\* ]*//g" | awk '{print $1}'
}
alias -g GH='$(git-hash)'

function git-branch() {
  git branch -a | peco | sed -e "s/^\*\s*//g"
}
alias -g GB='$(git-branch)'

function git-reflog() {
  git reflog | peco | awk '{print $1}'
}
alias -g GR='$(git-reflog)'

function git-changed-files() {
  git status --short | peco | awk '{print $2}'
}
alias -g GF='$(git-changed-files)'

# PS
function peco-ps() {
  ps aux | peco | awk '{print $2}'
}
alias -g PID='$(peco-ps)'

# File
function peco-file-search() {
  find . -type f -name "*${1}*" | grep -v "/\.git\|/\.svn\|/\.hg" | peco
}
alias -g FN='$(peco-file-search)'
