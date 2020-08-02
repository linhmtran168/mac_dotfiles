##
# FZF
##
# Peco for repo
function ghq-src
  commandline | read -l buffer
  ghq list --full-path | \
    sd "$HOME" "" | \
    fzf --query "$buffer" | \
    read -l repository_path
  if test -n "$repository_path"
    commandline "cd ~/$repository_path"
    commandline -f execute
  end
  commandline -f repaint
end

# peco for git
function git-hash
  git lg | fzf | sd "^[\*\|][ |\\\/\* ]*" "" | awk '{print $1}'
end

alias fgh=git-hash

function git-branch
  git branch -a | fzf | sd "^\*\s*" "" | awk '{print $1}'
end

alias fgb=git-branch

function git-reflog
  git reflog | fzf | awk '{print $1}'
end

alias fgr=git-reflog

function git-changed-files
  git status --short | fzf | awk '{print $2}'
end

alias fgf=git-changed-files

# PS
function fzf-ps
  ps aux | fzf | awk '{print $2}'
end

alias fps=fzf-ps

# File
function fzf-file-search
  fd -t f "$1" . | rg -v "/\.git\|/\.svn\|/\.hg" | fzf
end

alias ffs=fzf-file-search
