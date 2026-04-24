# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal macOS dotfiles. Configs live in this tree and are **symlinked** into `~` or `~/.config/` by `install.sh`. Editing a file here changes the live config — no rebuild, no deploy. There is no test suite, no lint, no CI.

Target environment: Apple Silicon macOS (`/opt/homebrew` paths hardcoded), fish as login shell, Ghostty as terminal, Zellij as multiplexer, Neovim as editor.

## Working on this repo

- **Symlink model:** changes to tracked files take effect immediately via the symlink. Exception: `.gitconfig` is *copied* (not symlinked) by `install.sh` so the email can be edited locally — edits here won't propagate to `~/.gitconfig` without a re-copy.
- **Reloading:** after editing shell config, `exec fish` (or open a new shell). After editing `zellij/config.kdl`, restart the Zellij session. Ghostty picks up `config.ghostty` on next launch.
- **`install.sh` is a bootstrap, not an idempotent installer.** It's meant to be read and partially pasted when setting up a new machine — several lines are commented out intentionally. Don't run it wholesale on an existing machine.
- **Known `install.sh` bugs** (fix if you touch the file): line 75 symlinks `~/mac_dotfiles/config.kdl` but the actual path is `zellij/config.kdl`; line 3's em-dash (`—install`) won't work — should be `--install`.
- **No install step exists** for `config.ghostty`, `neovide/config.toml`, `starship.toml`, or `scripts/cron.sync_logseq.plist`. If you add install logic for one of these, follow the symlink pattern used for tmux/zellij/vim.
- **`old/` is an archive** (Spacemacs, Alacritty, zsh configs). Don't edit unless explicitly asked — changes here have no effect on the live system.

## Architecture notes

### Shell (fish)
`fish_conf/init.fish` is symlinked to `~/.config/fish/conf.d/init.fish` and is the single entry point for env, PATH, aliases, and tool init (mise, direnv, zoxide, fzf, base16). `fish_conf/fzf.fish` defines fzf-backed functions (`fzf-src` uses `ghq list` for repo-jumping, bound to `Ctrl+]` in insert mode). Vi keybindings are on (`fish_vi_key_bindings`).

### Terminal → Multiplexer → Editor integration
The Ghostty + Zellij + Neovim stack is intentionally wired together:

- **Zellij default mode is `locked`** — it stays out of the way until `Ctrl+A` switches to `tmux` mode (see `zellij/config.kdl`). This mirrors tmux muscle memory.
- **`Ctrl+hjkl` is shared across Zellij modes except `locked` and `tmux`**, which lets `smart-splits.nvim` in Neovim do seamless edge-crossing between Vim splits and Zellij panes. Neovim sees raw `Ctrl+hjkl` in locked mode; Zellij consumes it otherwise.
- **Ghostty's `shift+enter=text:\x1b\r`** rebind (in `config.ghostty`) is there so multi-line TUIs (Claude Code, Aider) insert newlines instead of submitting.
- **`ZELLIJ_AUTO_ATTACH=true`** in `init.fish` auto-attaches to an existing session on shell start.

Changing any one of these three configs in isolation can break the others — think about the stack when editing.

### Zellij aliases
`init.fish` defines a `zl*` family of aliases mirroring the `tm*` tmux aliases (e.g. `zld` = new session named after cwd basename, `zla` = attach). Keep the two sets parallel if you add one.

### Git
`.gitconfig` uses `delta` as pager with side-by-side diffs and `diff3` merge conflict style. `ghq root = ~/Dev` — this is what `fzf-src` walks. Personal includeIf block at the bottom is commented out.

## Common tasks

- Edit shell env/aliases → `fish_conf/init.fish`, then `exec fish`.
- Edit Zellij keybindings → `zellij/config.kdl`, then detach/reattach.
- Edit Ghostty → `config.ghostty`, relaunch Ghostty.
- Add a new tool to the brew install list → `install.sh` line 14–17 (formula) or 20–22 (cask).
- Bootstrap a new mac → read `install.sh` top-to-bottom and run sections manually; don't `sh install.sh`.
