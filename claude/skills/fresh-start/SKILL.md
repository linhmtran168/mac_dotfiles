---
name: fresh-start
description: Log a session summary then clear the conversation to free up context. Use when the user says "fresh start", "clear and log", "save and reset", or wants to start a new task in the same session without losing notes.
disable-model-invocation: true
argument-hint: "[optional focus for next task]"
---

# Fresh Start

Run `/wrapup` to save session context, then `/clear` to reset the conversation.

This is useful when you've finished a task and want to start something new
without losing the record of what you just did.

## Steps

### 1. Run wrapup

Invoke the `/wrapup` skill. Wait for it to complete and confirm the note file path
before proceeding. Do NOT skip this step or run it in the background.

### 2. Confirm before clearing

After the note is saved, tell the user:

> Session logged to `{filepath}`. About to clear conversation history. Ready?

Wait for the user to confirm. Do NOT auto-clear.

### 3. Clear the session

Once confirmed, run `/clear` to reset the conversation and free up context.

### 4. Greet the new session

After clearing, if the user provided arguments (via `$ARGUMENTS`), acknowledge them
as the starting point for the next task. For example:

- `/fresh-start refactor the webhook handler` → After clearing, say something like
  "Context cleared. Let's work on refactoring the webhook handler. Want me to start
  by reading the current implementation?"

- `/fresh-start` (no arguments) → After clearing, say "Context cleared. Session
  notes saved. What are we working on next?"

### 5. Load prior context if relevant

If the user's next task is related to previous work, proactively suggest loading
relevant session notes using `/session-recall`.
