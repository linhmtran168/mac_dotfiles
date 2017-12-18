# Create ssh key
ssh-keygen -t rsa -b 4096 -C "email"
# Clone dotfiles directory
git clone git@github.com:linhmtran168/mac_dotfiles.git
# Install package
brew install python fish python vim tmux cmake mono fzf z thefuck rbenv nvm golang
# Change default shell to fish
chsh -s /usr/local/bin/fish
sudo vim /etc/shells

# Install brew package
brew cask install java calibre dash appcleaner flux postgres

# Symlink config file
ln -sf ~/mac_dotfiles/.gitignore_global  ~
ln -sf ~/mac_dotfiles/.gitignore ~
ln -sf ~/mac_dotfiles/.gitconfig ~
ln -sf ~/mac_dotfiles/fish_conf/before.init.fish ~/.config/omf/
mkdir ~/.config/fish/functions
ln -sf ~/mac_dotfiles/fish_conf/fish_prompt.fish ~/.config/fish/functions/
ln -sf ~/mac_dotfiles/fish_conf/init.fish ~/.config/omf
ln -sf ~/mac_dotfiles/fish_conf/key_bindings.fish .config/omf/

# Fish
## OMF
curl -L https://get.oh-my.fish | fish
omf install nvm foreign-env osx pbcopy python rbenv rustup thefuck vi-mode z
## Fisher
curl -Lo ~/.config/fish/functions/fisher.fish --create-dirs https://git.io/fisher
fisher install ansible-completion docker-completion fzf gitignore settitle

# Vim
ln -sf ~/mac_dotfiles/.vimrc ~
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir .vim/undodir

# Base 16
ghq get https://github.com/chriskempson/base16-iterm2
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell

# Powerline
pip3 install powerline-status
ghq get git@github.com:powerline/powerline.git
ghq get git@github.com:powerline/fonts.git

# Tmux
mkdir -p ~/.config/powerline/themes/tmux/
ln -sf ~/mac_dotfiles/tmux_default.json ~/.config/powerline/themes/tmux/default.json
ln -sf ~/mac_dotfiles/.tmux.conf ~

# Golang
mkdir -p ~/Dev/go
go get -u github.com/nsf/gocode
go get -u github.com/motemen/ghq

# NVM
nvm install 9.3.0
nvm alias default 9.3.0
npm -g install diff-so-fancy tern js-beautify eslint

# Ruby
rbenv install 2.4.3
rbenv global 2.4.3

# Rust
curl https://sh.rustup.rs -sSf | sh
