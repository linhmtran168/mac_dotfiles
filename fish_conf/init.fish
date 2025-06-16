## Env setup
# Set language
set -xg LC_ALL en_US.UTF-8
set -xg LANG en_US.UTF-8
# Go
set -xg GOPATH $HOME/Dev/go
# Mono
set -xg MONO_GAC_PREFIX "/usr/local"
# Modular
set -xg MODULAR_PATH $HOME/.modular
# Chrome
set -xg CHROME_BIN '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome'

# set -xg LIBRARY_PATH $LIBRARY_PATH /opt/homebrew/opt/zstd/lib

# Docker
set -xg COMPOSE_BAKE true

# Set required paths
fish_add_path --global --move --path $HOME/.local/bin $GOPATH/bin

# Brew
set --global --export HOMEBREW_PREFIX "/opt/homebrew";
set --global --export HOMEBREW_CELLAR "/opt/homebrew/Cellar";
set --global --export HOMEBREW_REPOSITORY "/opt/homebrew";
fish_add_path --global --move --path "/opt/homebrew/bin" "/opt/homebrew/sbin";
if test -n "$MANPATH[1]"; set --global --export MANPATH '' $MANPATH; end;
if not contains "/opt/homebrew/share/info" $INFOPATH; set --global --export INFOPATH "/opt/homebrew/share/info" $INFOPATH; end

# Active mise to active tool's path
if status is-interactive
  mise activate fish | source
else
  mise activate fish --shims | source
end

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

# Zellij
alias zln='zellij -s'
alias zld='zellij -s (basename (pwd))'
alias zll='zellij ls'
alias zlk='zellij k'
alias zlka='zellij ka'
alias zlds='zellij d'
alias zldsa='zellij da'
alias zla='zellij a'
alias zlc='zellij -n compact'
alias zlcn='zellij -n compact -s'
alias zlcd='zellij -n compact -s (basename (pwd))'

# Wezterm update
alias upwt='brew upgrade --cask wezterm@nightly --force --no-quarantine --greedy-latest'

# Alias to flush nat route for multipass
alias flpf='sudo pfctl -f /etc/pf.conf'

# 1Password
source ~/.config/op/plugins.sh

## Other functions
# Direnv
eval (direnv hook fish)

# Base16
if status --is-interactive
  set BASE16_SHELL_PATH "$HOME/.config/base16-shell"
  if test -s "$BASE16_SHELL_PATH"
    set -g BASE16_CONFIG_PATH "$HOME/.config/tinted-theming"
    source "$BASE16_SHELL_PATH/profile_helper.fish"
  end
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

# Helper function
function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

# Cloud SDK
# source "/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc"

# FZF
set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore-vcs --hidden'
fzf --fish | source
source $HOME/mac_dotfiles/fish_conf/fzf.fish
bind -M insert \c] fzf-src # -M for insert mode

# Zoxide
zoxide init fish | source
set -xg __zoxide_z_prefix 'z!'

