## Env setup
# Set language
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
# Go
set -xg GOPATH $HOME/Dev/go
set -xg GOROOT /usr/local/opt/go/libexec
# Mono
set -xg MONO_GAC_PREFIX "/usr/local"
# Chrome
set -xg CHROME_BIN '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'
# Set path
set --universal fish_user_paths $fish_user_paths $HOME/.local/bin $HOME/.cargo/bin $GOPATH/bin /usr/local/sbin /opt/homebrew/bin

## Key bindings
# Vi mode
fish_vi_key_bindings

## Alias
# OSX
alias fixow='/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder;echo "Open With has been rebuilt, Finder will relaunch"'
# tmux
alias tma='tmux attach -d -t'
alias tmd='tmux new -s (basename (pwd))'
alias tmn='tmux new -s'
alias tml='tmux list-sessions'
alias tmk='tmux kill-session -t'
alias tmkna='tmux list-sessions | grep -v attached | awk \'BEGIN{FS=":"}{print $1}\' | xargs -n 1 tmux kill-session -t'

# Wezterm update
alias upwt='brew upgrade --cask wezterm-nightly --force --no-quarantine --greedy-latest'

# Alias to flush nat route for multipass
alias flpf='sudo pfctl -f /etc/pf.conf'

## Other functions
# Direnv
eval (direnv hook fish)

# Asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Base16
if status --is-interactive
  set BASE16_SHELL $HOME/.config/base16-shell/
  source $BASE16_SHELL/profile_helper.fish
end

# Anaconda
function tg_conda
  if test -z "$PYTHON_DIST"
    set -gx _OLD_PATH $PATH
    set -gx PATH $HOME/miniconda3/bin $PATH
    source (conda info --root)/etc/fish/conf.d/conda.fish
    set -gx PYTHON_DIST 'conda'
    echo "Using Anaconda Python"
  else
    set -gx PATH $_OLD_PATH
    set -e PYTHON_DIST
    echo "Back to system Python"
  end
end

# Cloud SDK
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

# FZF
set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
source $HOME/mac_dotfiles/fish_conf/fzf.fish
bind -M insert \c] fzf-src # -M for insert mode

# Zoxide
zoxide init fish | source
set -xg __zoxide_z_prefix 'z!'

