#!/bin/sh
# Xcode
xcode-select —install

# Create ssh key => do manually => upload to github
# ssh-keygen -t rsa -b 4096 -C "email"
# Clone dotfiles directory
cd ~
git clone git@github.com:linhmtran168/mac_dotfiles.git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install brew package
brew install fish python vim tmux cmake dust diff-so-fancy bat sd hyperfine exa fd fzf xh \
	ghq golang helm hadolint htop minikube ripgrep sd starship tokei \
	tealdeer cheat curlie git-delta duf procs broot terraform kubernetes-cli direnv asdf zoxide \
	bottom lazygit lazydocker luarocks juliaup zellij

# Install brew casks
brew install --cask temurin 1password alfred appcleaner calibre font-cascadia-code-pl font-caskaydia-cove-nerd-font \
	google-cloud-sdk microsoft-edge anki visual-studio-code rectangle contexts wezterm betterdisplay istat-menus \
	aws-vault
# Docker
brew install homebrew/cask/docker

# Necessary software in the app store
# Moom, The Unarchiver, Microsoft To do, Onedrive
# Microsoft office

# Fish
# Change default shell to fish
# Must run sudo vim /etc/shells to add fish to list of shell
chsh -s /opt/homebrew/bin/fish
## fisher
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
## tide
fisher install IlanCosman/tide@v6

# Wezterm
mkdir -p $HOME/.config/wezterm/ && git clone https://github.com/frdwin/Everforest-Wezterm $HOME/.config/wezterm/colors
# Symlink config file for git and fish
ln -sf ~/mac_dotfiles/.gitignore_global ~/.gitignore_global
cp ~/mac_dotfiles/.gitconfig ~/.gitconfig # must manually change email in git config
ln -sf ~/mac_dotfiles/fish_conf/init.fish ~/.config/fish/conf.d/init.fish

# Vim
ln -sf ~/mac_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
	https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undodir

# Base 16
git clone https://github.com/tinted-theming/base16-shell.git "$HOME/.config/base16-shell"

# Powerline
pip3 install powerline-status
pip3 install psutil
ghq get git@github.com:powerline/powerline.git

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
ln -sf ~/mac_dotfiles/.tmux.conf ~/.tmux.conf
## Tmux powerline
ln -sf ~/mac_dotfiles/tmux-powerline/config.sh ~/.config/tmux-powerline/config.sh
ln -sf ~/mac_dotfiles/tmux-powerline/themes/simple.sh ~/.config/tmux-powerline/themes/simple.sh

# Zellij
mkdir -p ~/.config/zellij
ln -sf ~/mac_dotfiles/config.kdl ~/.config/zellij/config.kdl

# Golang
mkdir -p ~/Dev/go

# ASDF
# Ruby
# asdf plugin add ruby https://github.com/asdf-vm/asdf-ruby.git
# asdf install ruby latest
# asdf global ruby latest
# asdf reshim ruby latest
# gem install pry
# Nodejs
# asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
# asdf install nodejs lts
# asdf global nodejs lts
# asdf reshim nodejs lts
# Mise
curl https://mise.run | sh

# Rust
curl https://sh.rustup.rs -sSf | sh
