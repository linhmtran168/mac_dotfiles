# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="murilasso"

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
plugins=(rbenv brew python pip virtualenvwrapper rails3 rails capistrano pow bundler rake gem ruby jruby git composer laravel lein node npm osx redis-cli cp history history-substring-search last-working-dir)

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

# Directory Alias
alias work='cd ~/SkyDrive/workspace'
alias course='cd ~/SkyDrive/Courses'
alias site='cd ~/SkyDrive/Sites'
alias project='cd ~/SkyDrive/Projects'

# Personal configuration
export EDITOR="vim"

# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Variable for tmux-powerline
export PLATFORM="mac"

PATH=$HOME/.rbenv/bin:$PATH
PATH=$PATH:$HOME/bin # Add local user bin to PATH
PATH=$PATH:/usr/local/share/python3
PATH=/Applications/Postgres.app/Contents/MacOS/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$PATH:$HOME/Documents/vert.x-1.3.0.final/bin
PATH=/usr/local/share/npm/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
