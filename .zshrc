# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# Personal configuration
export EDITOR="vim"

# Variable for tmux-powerline
export PLATFORM="mac"

# PATH references
PATH=$HOME/.rbenv/bin:$PATH
PATH=$HOME/bin:$PATH # Add local user bin to PATH
# PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=/usr/local/share/python:$PATH
PATH=/usr/local/share/python3:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="suvash"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(heroku rbenv brew python pip virtualenv virtualenvwrapper rails4 rails3 rails capistrano pow bundler rake gem ruby jruby composer laravel lein node npm osx tmux redis-cli cp history last-working-dir history-substring-search command-not-found sbt scala go golang git git-extras)

# plugins=(rbenv osx cp history history-substring-search last-working-dir)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
# Zsh completion
fpath=(/usr/local/share/zsh-completions $fpath)

# Alias
# alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias gc='git commit'
alias gco='git checkout'
alias ge='git merge'
alias gp='git push'
alias gd='git diff'
alias gl='git log'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Directory Alias
alias work='cd ~/SkyDrive/workspace'
alias course='cd ~/SkyDrive/Courses'
alias site='cd ~/SkyDrive/Sites'
alias project='cd ~/SkyDrive/Projects'

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# liquidprompt
# source ~/Documents/liquidprompt/liquidprompt
