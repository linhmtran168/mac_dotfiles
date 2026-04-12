---
name: session-recall
description: Search and review past session notes. Use when the user says "recall", "catch me up", "what did we do last time", "resume", "pick up where we left off", or asks about previous work on any project.
allowed-tools: Bash, Read, Grep, Glob
---

# Session Recall

Search and surface past session summaries stored by the `/wrapup` skill.

**Notes location:** `~/.claude/notes/`

## Determine scope

Choose the right retrieval strategy based on what the user is asking:

| User intent | Strategy |
|---|---|
| `/session-recall` or "what did we do last time?" | Read the latest note for the current project |
| "catch me up" or "resume" or "pick up where we left off" | Read the last 3–5 notes, synthesize key context and open items |
| A specific topic (e.g., "when did we fix the auth bug?") | `grep -rl "{keyword}" ~/.claude/notes/$(basename $(pwd))/` then read matches |
| A specific date range (e.g., "what did we work on last week?") | `ls -lt ~/.claude/notes/$(basename $(pwd))/` and filter filenames by date |
| A different project (e.g., "what was I doing in payments?") | `ls ~/.claude/notes/` to list projects, then read from the named one |
| Broad cross-project search | `grep -rl "{keyword}" ~/.claude/notes/` across all projects |

## Retrieval commands

```bash
# Current project name
PROJECT_NAME=$(basename $(pwd))
NOTES_DIR="$HOME/.claude/notes/$PROJECT_NAME"

# Latest note
ls -t "$NOTES_DIR" | head -1

# Last N notes
ls -t "$NOTES_DIR" | head -5

# Keyword search (current project)
grep -rl "keyword" "$NOTES_DIR"

# Keyword search (all projects)
grep -rl "keyword" "$HOME/.claude/notes/"

# List all projects with notes
ls "$HOME/.claude/notes/"
```

## Presenting results

- Summarize the relevant notes concisely.
- **Prioritize "Next Steps" and "Outstanding Issues"** from those sessions — these are the most actionable.
- If the user is resuming work, proactively suggest picking up from the most recent "Next Steps" as a starting checklist.
- If no notes exist for the current project, say so and offer to list other projects that do have notes.
- If a keyword search returns no results in the current project, automatically widen to all projects and mention which project the match came from.
