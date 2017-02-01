#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh completion
fpath=(/usr/local/share/zsh/site-functions /usr/local/share/zsh-completions $fpath)

# Function to toggle between anaconda and system python
function tg_conda {
  if  [[ -z "$PYTHON_DIST" ]]; then
    _OLD_PATH="$PATH"
    export PATH="$HOME/anaconda/bin:$PATH"
    export PYTHON_DIST='pydist:conda'
    echo "Using Anaconda Python"
  else
    export PATH="$_OLD_PATH"
    unset PYTHON_DIST
    echo "Back to system Python"
  fi
}

# Alias
# OSX
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# tmux
alias tma='tmux attach -d -t'
alias tmn='tmux new -s $(basename $(pwd))'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# bower
alias bower='noglob bower'

# Directory Alias
alias work='cd ~/OneDrive/workspace'
alias course='cd ~/OneDrive/Courses'
alias src='cd ~/Dropbox/Src'

# Peco
if [[ -s "$HOME/mac_dotfiles/peco.zsh" ]]; then
  source "$HOME/mac_dotfiles/peco.zsh"
fi

# Autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# Base16 Shell
BASE16_SHELL=$HOME/.config/base16-shell/
[ -n "$PS1"  ] && [ -s $BASE16_SHELL/profile_helper.sh  ] && eval "$($BASE16_SHELL/profile_helper.sh)" 

# TheFuck
eval "$(thefuck --alias fuk)"
