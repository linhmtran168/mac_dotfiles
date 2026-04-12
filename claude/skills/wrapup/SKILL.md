---
name: wrapup
description: Log a session summary before wrapping up. Use when the user says "wrap up", "end session", "log what we did", or when prompted by the Stop hook.
disable-model-invocation: true
allowed-tools: Bash, Read, Grep, Glob, Write
---

# Wrap Up Session

Log a structured, context-rich session note that gives a future Claude session (or the user) enough information to resume work, understand decisions, or apply learnings to related problems.

**Notes location:** `~/.claude/notes/{project_name}/{session-title}-{datetime}.md`

## Steps

### 1. Resolve paths

```bash
PROJECT_NAME=$(basename $(pwd))
DATETIME=$(date +%Y%m%d-%H%M%S)
NOTES_DIR="$HOME/.claude/notes/$PROJECT_NAME"
mkdir -p "$NOTES_DIR"
```

### 2. Gather context

- Run `git status` and `git diff --stat` for what changed.
- Run `git diff` (or `git diff --cached` if staged) to review the actual code changes.
- Review conversation history for key decisions, rejected approaches, and constraints discovered.

### 3. Write the session note

Use the template below. Every section matters — a future session loading this note should be able to understand the *why*, not just the *what*.

```markdown
# {Session Title}

**Date:** {YYYY-MM-DD HH:MM}
**Project:** {project_name}
**Working directory:** {full path}
**Branch:** {current git branch}

## Objective

What was the user trying to accomplish this session? State the goal clearly enough
that a fresh session could pick it up with no other context.

## What changed

For each file or group of related files:
- **{filepath}** — What was changed and *why*. Not just "modified" — explain the
  reasoning. Include relevant details like function signatures, config values, or
  API endpoints that someone resuming would need.

## Key decisions & trade-offs

Document choices that were made and *why*, especially:
- Alternatives that were considered and rejected (and why)
- Constraints discovered (library limitations, API quirks, performance concerns)
- Assumptions made that might need revisiting

## How it works

If the session involved building or modifying a feature/system, briefly explain
how it works now. Include enough detail that a future session can understand the
current state without re-reading all the code. Pseudo-code, data flow, or
architecture notes are helpful here.

## Problems encountered & solutions

Document any bugs, errors, or unexpected behavior and how they were resolved.
Include error messages, stack traces, or config details that would help if the
same problem resurfaces.

## Current state

- What is working now?
- What is broken or incomplete?
- Are there any temporary hacks, TODOs, or commented-out code that need attention?

## Next steps

Ordered by priority. Be specific — not "finish the feature" but "implement the
retry logic in SqsConsumer.ProcessMessageAsync, then add the integration test
that verifies backoff timing."

## Related context

Links, docs, or references that came up during the session and would be useful
for follow-up work. Include relevant file paths within the project.
```

### 4. Save the file

Write to `~/.claude/notes/{project_name}/{session-title}-{YYYYMMDD-HHMMSS}.md`

The `{session-title}` should be a short kebab-case slug derived from the objective
(e.g., `fix-sqs-retry-logic`, `add-cad-pdf-pipeline`, `ocr-rebar-symbol-rules`).

### 5. Confirm

Print the full file path so the user knows where it was saved.
