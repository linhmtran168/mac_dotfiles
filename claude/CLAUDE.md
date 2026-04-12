# Global Settings

## GitHub Comments

Every GitHub comment (PR comments, issue comments, PR reviews, PR descriptions) must end with:

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## PR Review Comment Format

When reviewing GitHub PRs and posting inline comments, always format each comment
with the severity label on its own line, followed by the explanation:

🔴 **[CRITICAL]**
Security vulnerabilities, data corruption, crashes, broken auth

🟠 **[HIGH]**
Logic bugs that break functionality or cause incorrect behavior

🟡 **[MEDIUM]**
Edge cases, error handling gaps, performance issues

🔵 **[LOW / NIT]**
Style, naming, minor improvements, non-blocking suggestions

Example comment:
> 🟠 **[HIGH]**
> This function doesn't handle the case where `user` is null,
> which will throw a TypeError at runtime when called from the login flow.

## Security & Sandboxing

- Never commit, output, modify, or transmit secrets, API keys, tokens, passwords, or credentials. If encountered in code, flag them immediately.
- Never write secrets to files (e.g., .env, config files) without explicit user confirmation. Prefer environment variables or secret managers.
- If you encounter `.env` files or `~/.ssh/`, ignore them unless specifically asked to debug a local configuration issue.
- **Default deny for network calls:** Do not execute `curl`, `wget`, or outbound network requests to external APIs unless explicitly instructed by the user.
- When executing code, scripts, or tests, utilize sandboxed environments (`/sandbox` or designated Docker containers) whenever available.
- Always validate and sanitize user inputs at system boundaries. Guard against injection attacks (SQL, command, XSS, path traversal).
- Use parameterized queries for all database interactions — never string-concatenate user input into queries.
- Never disable SSL/TLS verification, certificate checks, or security middleware.
- Never weaken authentication or authorization mechanisms (e.g., hardcoded passwords, disabled CSRF, permissive CORS).
- Prefer least-privilege principles: request minimal permissions, scopes, and access levels.

## Privacy & Data Handling

- Treat all code, logs, and documentation in the repository as proprietary. Do not synthesize this data with external sources.
- Never read, transmit, or process files outside the project directory without explicit user permission.
- Never send project data to external services or APIs unless the user explicitly requests it.
- If you detect PII or PHI in logs or data samples, mask it immediately in outputs (e.g., replace IPs with `[IP_REDACTED]`, emails with `[EMAIL_REDACTED]`).
- Never include PII in commits, logs, comments, or generated output unless the user explicitly provides it for that purpose.
- Avoid caching or storing sensitive user data in memory files or persistent storage.

## System Performance & Context

- Avoid running resource-intensive commands (large builds, full test suites, heavy installations) without user confirmation.
- Prefer targeted operations over broad ones: run specific tests instead of full suites, read specific files instead of entire directories.
- **Context optimization:** Reference large, static files (documentation, logs) at the beginning of context. Avoid re-reading files already in context.
- **MCP preference:** Use established MCP servers and tools for data retrieval and tool execution rather than writing ad-hoc Bash scripts for standard tasks.
- **Adaptive verbosity:** Scale output to task complexity. Be direct and concise for simple tasks. Provide step-by-step reasoning for complex architectural decisions.
- Kill or stop background processes when they are no longer needed.
- Avoid installing global packages or making system-wide changes without user confirmation.
- Prefer streaming/paginated reads for large files instead of loading everything into memory.

## Usage Cost Efficiency

- **Token economy:** When modifying large files, output only relevant diffs or snippets rather than rewriting the entire file, unless explicitly asked.
- **Task routing:** Complete trivial tasks (regex, typo fixes, simple formatting) swiftly with minimal output. Reserve extensive reasoning for deep debugging or feature engineering.
- Prefer targeted file reads (specific line ranges) over reading entire large files.
- Use Glob and Grep directly for simple searches before resorting to Agent subprocesses.
- Avoid redundant tool calls — do not re-read files already in context or repeat searches.
- Batch independent operations into parallel tool calls to minimize round trips.

## System Safety & Execution Guardrails

- **Human-in-the-loop for destructive actions:** Require explicit user confirmation before:
  1. Deleting files or dropping databases (`rm -rf`, `DROP TABLE`).
  2. Mutating production states or executing remote deployments.
  3. Pushing code to upstream repositories (`git push`).
  4. Running `git reset --hard`, `kill -9`, or any irreversible command.
- Never force-push to shared/protected branches (main, master, develop, release).
- Never modify CI/CD pipelines, deployment configs, or infrastructure files without user confirmation.
- Never modify system-level configuration files (/etc/*, shell profiles, global git config) without explicit user confirmation.
- Always check for uncommitted changes before running operations that could overwrite work.
- Prefer creating new git commits over amending existing ones to preserve history.
- When encountering merge conflicts, resolve them rather than discarding changes.
- Before deleting files or branches, verify they are not in active use.
- **Pin dependencies:** When writing scripts, Dockerfiles, or configs, always pin dependencies to specific versions — never use `latest`.
- **Idempotency:** Ensure proposed scripts and automation can be run multiple times without unintended side effects.
