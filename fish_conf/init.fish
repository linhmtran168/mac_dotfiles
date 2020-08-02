# Set language
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
# Base16 shell
set -xg BASE16_SHELL $HOME/.config/base16-shell/
# Go
set -xg GOPATH $HOME/Dev/go
set -xg GOROOT /usr/local/opt/go/libexec
# NVM
set -xg NVM_DIR $HOME/.nvm
# Mono
set -xg MONO_GAC_PREFIX "/usr/local"
# Chrome
set -xg CHROME_BIN '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
# Set path
set --universal fish_user_paths $fish_user_paths $HOME/.cargo/bin $GOPATH/bin $HOME/.composer/vendor/bin

# Alias
# OSX
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'

# Direnv
eval (direnv hook fish)
# tmux
alias tma='tmux attach -d -t'
alias tmd='tmux new -s (basename (pwd))'
alias tmn='tmux new -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'

# Directory Alias
alias work='cd ~/OneDrive/workspace'
alias course='cd ~/OneDrive/Courses'
alias src='cd ~/Dev'

# Anaconda
function tg_conda
  if test -z "$PYTHON_DIST"
    set -gx _OLD_PATH $PATH
    set -gx PATH $HOME/anaconda3/bin $PATH
    source (conda info --root)/etc/fish/conf.d/conda.fish
    set -gx PYTHON_DIST 'conda'
    echo "Using Anaconda Python"
  else
    set -gx PATH $_OLD_PATH
    set -e PYTHON_DIST
    echo "Back to system Python"
  end
end

# Base16
if status --is-interactive
  eval sh $BASE16_SHELL/scripts/base16-tomorrow-night.sh
end

# FZF
source $HOME/mac_dotfiles/fish_conf/fzf.fish

# FZF
set -gx FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
