#!/bin/sh
# Xcode
xcode-select —install

# Create ssh key => do manually => upload to github
# ssh-keygen -t rsa -b 4096 -C "email"
# Clone dotfiles directory
cd ~ || exit
git clone git@github.com:linhmtran168/mac_dotfiles.git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install brew package
brew install fish python vim nvim tmux cmake dust bat sd hyperfine fd fzf xh \
  ghq golang helm hadolint htop minikube ripgrep sd tokei \
  tealdeer cheat curlie git-delta duf procs broot terraform kubernetes-cli direnv zoxide \
  bottom lazygit lazydocker lsd zellij eza tree-sitter-cli starship

# Install brew casks
brew install --cask temurin 1password alfred appcleaner calibre font-cascadia-code-nf font-monaspace-nf \
  google-cloud-sdk microsoft-edge anki visual-studio-code rectangle contexts wezterm betterdisplay istat-menus \
  aws-vault zed
# Docker
brew install homebrew/cask/docker

# Necessary software in the app store
# The Unarchiver, Microsoft To do, Onedrive
# Microsoft office

# Fish
# Change default shell to fish
# Must run sudo vim /etc/shells to add fish to list of shell
chsh -s /opt/homebrew/bin/fish
## fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
## Fish config
ln -sf ~/mac_dotfiles/fish_conf/init.fish ~/.config/fish/conf.d/init.fish
## Link starship config
ln -sf ~/mac_dotfiles/starship.toml ~/.config/starship.toml

# Symlink config file for git and fish
ln -sf ~/mac_dotfiles/.gitignore_global ~/.gitignore_global
cp ~/mac_dotfiles/.gitconfig ~/.gitconfig # must manually change email in git config

# Vim
ln -sf ~/mac_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undodir

# Neovim
git clone git@github.com:linhmtran168/lazynvim_configs.git ~/.config/nvim

# Zellij
mkdir -p ~/.config/zellij
ln -sf ~/mac_dotfiles/zellij/config.kdl ~/.config/zellij/config.kdl
ln -sf ~/mac_dotfiles/zellij/default.kdl ~/.config/zellij/layouts/default.kdl

# Zed
ln -sf ~/mac_dotfiles/zed/settings.json ~/.config/zed/settings.json

# Golang
mkdir -p ~/Dev/go

# Ghostty
brew install --cask ghostty
ln -sf ~/mac_dotfiles/config.ghostty ~/.config/ghostty/config.ghostty

# Mise
curl https://mise.run | sh

# Rust
curl https://sh.rustup.rs -sSf | sh

# AI
# Claude
curl -fsSL https://claude.ai/install.sh | bash
# Codex
brew install codex
# Opencode
brew install anomalyco/tap/opencode
