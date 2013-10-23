# Python virtualenv configuration
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_VIRTUALENV_ARGS='--no-site-packages'

# Personal configuration
export EDITOR="vim"

# Variable for tmux-powerline
export PLATFORM="mac"

# GO
export GOROOT=/usr/local/Cellar/go/1.1.2/
export GOPATH=$HOME/SkyDrive/go

# PATH references
PATH=$GOPATH/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
PATH=$HOME/bin:$PATH # Add local user bin to PATH
PATH=/usr/local/share/npm/bin:$PATH
PATH=$HOME/.cabal/bin:$PATH
PATH=/usr/local/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=/opt/homebrew-cask/Caskroom/postgres/latest/Postgres.app/Contents/MacOS/bin/:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

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
plugins=(heroku rbenv brew python pip virtualenv virtualenvwrapper rails4 rails3 rails capistrano pow bundler rake gem ruby jruby composer laravel lein node npm osx tmux redis-cli cp history last-working-dir history-substring-search command-not-found sbt scala go golang git git-flow)

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
alias gpl='git pull'
alias gd='git diff'
alias gl='git log'
alias gs='git status'
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Directory Alias
alias work='cd ~/SkyDrive/workspace'
alias course='cd ~/SkyDrive/Courses'
alias site='cd ~/SkyDrive/Sites'
alias project='cd ~/SkyDrive/Projects'

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#zsh syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Temporarily fix for npm
# ulimit -n 8192

# Set Locale
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
