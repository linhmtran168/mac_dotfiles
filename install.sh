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
brew install python fish python vim tmux cmake dust diff-so-fancy bat sd hyperfine exa fd fzf xh z \
    ghq rbenv nvm golang helm hadolint htop minikube ripgrep sd starship tokei \
    tealdeer cheat curlie git-delta duf procs broots terraform kubernetes-cli direnv
brew install clementtsang/bottom/bottom
# Install brew casks
brew tap adoptopenjdk/openjdk
brew tap homebrew/cask-fonts
brew install --cask adoptopenjdk 1password alfred appcleaner calibre font-cascadia-code-pl font-caskaydia-cove-nerd-font \
    iterm2 google-cloud-sdk microsoft-edge postman anki visual-studio-code
# Docker
brew install homebrew/cask/docker

# Necessary software in the app store
# Moom, The Unarchiver, Microsoft To do, Onedrive
# Microsoft office

# Fish
# Change default shell to fish
# Must run sudo vim /etc/shells to add fish to list of shell
chsh -s /usr/local/bin/fish
## OMF
curl -L https://get.oh-my.fish | fish
omf update
omf install nvm foreign-env osx pbcopy python rbenv rustup thefuck z brew fzf

# Symlink config file for git and fish
ln -sf ~/mac_dotfiles/.gitignore_global  ~/.gitignore_global
cp ~/mac_dotfiles/.gitconfig ~/.gitconfig # must manually change email in git config
ln -sf ~/mac_dotfiles/fish_conf/init.fish ~/.config/omf/init.fish
ln -sf ~/mac_dotfiles/fish_conf/key_bindings.fish ~/.config/omf/key_bindings.fish
ln -sf ~/mac_dotfiles/starship.toml ~/.config/starship.toml

# Vim
ln -sf ~/mac_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undodir

# Base 16
ghq get git@github.com:martinlindhe/base16-iterm2.git # Manually change theme using iterm config
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell # Use base16-xxx shell command to change theme

# Powerline
pip3 install powerline-status
pip3 install psutil
ghq get git@github.com:powerline/powerline.git

# Tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
mkdir -p ~/.config/powerline/themes/tmux/
ln -sf ~/mac_dotfiles/tmux_default.json ~/.config/powerline/themes/tmux/default.json
ln -sf ~/mac_dotfiles/.tmux.conf ~/.tmux.conf

# Golang
mkdir -p ~/Dev/go

# NVM
nvm install --lts
nvm use --lts
nvm alias default node
npm -g install eslint

# Ruby
rbenv install 2.7.3
rbenv global 2.7.3
gem install pry awesome_print bundler rubocop

# Rust
curl https://sh.rustup.rs -sSf | sh

