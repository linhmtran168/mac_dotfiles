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

# Customize to your needs...
# Variable for tmux-powerline
export PLATFORM="mac"

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
alias nw='/opt/homebrew-cask/Caskroom/node-webkit/0.9.2/node-webkit.app/Contents/MacOS/node-webkit'

# ligt-table
alias light='/opt/homebrew-cask/Caskroom/lighttable/0.6.4/LightTable/LightTable.app/Contents/MacOS/node-webkit'
alias julia='/opt/homebrew-cask/Caskroom/julia/0.2/Julia-0.2.0.app/Contents/Resources/julia/bin/julia'

# Directory Alias
alias work='cd ~/OneDrive/workspace'
alias course='cd ~/OneDrive/Courses'
alias depg='cd ~/OneDrive/DevPlayground'
alias jspg='cd ~/Dropbox/JsPlayground'
alias code='cd ~/OneDrive/Codes'
alias project='cd ~/OneDrive/Projects'

# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# Direnv
eval "$(direnv hook zsh)"
