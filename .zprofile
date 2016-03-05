#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

if [[ -z "$LC_ALL" ]]; then
  export LC_ALL='en_US.UTF-8'
fi

#
# Paths
#

# Chrome path
export CHROME_BIN='/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'

# Composer
export COMPOSER_DIR=$HOME/.composer

# GO
export GOPATH=$HOME/Dev/go

# NVM
export NVM_DIR=$HOME/.nvm

# Mono
export MONO_GAC_PREFIX="/usr/local"

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath path

# Set the the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

# Set the list of directories that Zsh searches for programs.
path=(
  /usr/local/{bin,sbin}
  /usr/local/opt/go/libexec/bin
  $GOPATH/bin
  $HOME/.local/bin
  /Applications/Postgres.app/Contents/Versions/latest/bin
  /usr/local/heroku/bin
  $COMPOSER_DIR/vendor/bin
  $path
)

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

#
# Temporary Files
#

if [[ ! -d "$TMPDIR" ]]; then
  export TMPDIR="/tmp/$LOGNAME"
  mkdir -p -m 700 "$TMPDIR"
fi

TMPPREFIX="${TMPDIR%/}/zsh"

# NVM
source $(brew --prefix nvm)/nvm.sh

# Rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# startup virtualenv-burrito
if [ -f $HOME/.venvburrito/startup.sh ]; then
    . $HOME/.venvburrito/startup.sh
fi
