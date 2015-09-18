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

# jdk
alias jdk7='export JAVA_HOME=`/usr/libexec/java_home -v 1.7`'

# Directory Alias
alias work='cd ~/OneDrive/workspace'
alias course='cd ~/OneDrive/Courses'
alias src='cd ~/Dropbox/Src'

# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# Pythonpy
alias py=/usr/local/bin/py

# TheFuck
alias fuk='$(thefuck $(fc -ln -1))'

# Peco
if [[ -s "$HOME/Dev/github.com/linhmtran168/mac_dotfiles/peco.zsh" ]]; then
  source "$HOME/Dev/github.com/linhmtran168/mac_dotfiles/peco.zsh"
fi

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Base16 Shell
BASE16_SHELL="$HOME/Dev/github.com/chriskempson/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL

# GVM
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
