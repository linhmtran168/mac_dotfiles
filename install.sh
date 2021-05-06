# Create ssh key
# ssh-keygen -t rsa -b 4096 -C "email"
# Clone dotfiles directory
cd ~
git clone git@github.com:linhmtran168/mac_dotfiles.git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
# Install brew package
brew install python fish python vim tmux cmake dust diff-so-fancy exa fd fzf z ghq rbenv nvm golang helm hadolint htop minikube ripgrep sd starship tokei
# Install brew casks
brew install 1password alfred adoptopendjdk appcleaner calibre font-cascadia-code-pl iterm2 google-cloud-sdk postman anki

# Fish
# Change default shell to fish
chsh -s /usr/local/bin/fish
sudo vim /etc/shells
## OMF
curl -L https://get.oh-my.fish | fish
omf install nvm foreign-env osx pbcopy python rbenv rustup thefuck vi-mode z brew

# Symlink config file for git and fish
ln -sf ~/mac_dotfiles/.gitignore_global  ~/.gitignore_global
cp ~/mac_dotfiles/.gitconfig ~/.gitconfig
# ln -sf ~/mac_dotfiles/fish_conf/before.init.fish ~/.config/omf/
# mkdir ~/.config/fish/functions
# ln -sf ~/mac_dotfiles/fish_conf/fish_prompt.fish ~/.config/fish/functions/
ln -sf ~/mac_dotfiles/fish_conf/init.fish ~/.config/omf/init.fish
ln -sf ~/mac_dotfiles/fish_conf/key_bindings.fish ~/.config/omf/key_bindings.fish

# Vim
ln -sf ~/mac_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir ~/.vim/undodir

# Base 16
ghq get git@github.com:martinlindhe/base16-iterm2.git
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Powerline
pip3 install powerline-status
ghq get git@github.com:powerline/powerline.git
# ghq get git@github.com:powerline/fonts.git

# Tmux
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

# Rust
curl https://sh.rustup.rs -sSf | sh
