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

# node-webkit
alias nw='/opt/homebrew-cask/Caskroom/node-webkit/0.11.6/node-webkit-v0.11.6-osx-x64/node-webkit.app/Contents/MacOS/node-webkit'
# light-table
alias light='/opt/homebrew-cask/Caskroom/lighttable/0.6.4/LightTable/LightTable.app/Contents/MacOS/node-webkit'
# julia
alias julia='/opt/homebrew-cask/Caskroom/julia/0.3.6/Julia-0.3.6.app/Contents/Resources/julia/bin/julia'
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

# Autojump
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh  ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

# Base16 Shell
BASE16_SHELL="$HOME/Dev/github.com/chriskempson/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL  ]] && source $BASE16_SHELL
