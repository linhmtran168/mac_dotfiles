##
# Peco
##
# Peco for repo
function peco-src
  commandline | read -l buffer
  ghq list --full-path | \
    sed -e "s|$HOME/||g" | \
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
  git lg | peco | sed -e "s/^[\*\|][ |\\\/\* ]*//g" | awk '{print $1}'
end

alias pgh=git-hash

function git-branch
  git branch -a | peco | sed -e "s/^\*\s*//g" | awk '{print $1}'
end

alias pgb=git-branch

function git-reflog
  git reflog | peco | awk '{print $1}'
end

alias pgr=git-reflog

function git-changed-files
  git status --short | peco | awk '{print $2}'
end

alias pgf=git-changed-files

# PS
function peco-ps
  ps aux | peco | awk '{print $2}'
end

alias pps=peco-ps

# File
function peco-file-search
  find . -type f -name "*$1*" | grep -v "/\.git\|/\.svn\|/\.hg" | peco
end

alias pfs=peco-file-search
