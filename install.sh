#!/bin/sh
# Install Xcode and command line tool
# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Tap additional repos
brew tap homebrew/dupes

# Install zsh and other packages
brew install rbenv zsh go nodejs python python3 scala sbt giter8 akka tmux wget openssl zsh-syntax-highlighting rethinkdb mongodb pyqt zmq svn erlang-r16 elixir leiningen casperjs ctags redis ack boris

# Install macvim
brew install macvim --HEAD --override-system-vim

# Install homebrew-cask
brew tap phinze/hombrew-cask
brew install brew-cask
brew cask install adium skype google-chrome spectacle alfred iterm2 vlc calibre f-lux sourcetree sublime-text mou u-torrent colloquy racket eclipse caffeine postgres firefox-aurora vagrant virtualbox shuttle
# Install quicklook plugin
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql webp-quicklook suspicious-package --force && qlmanage -r
# Setup Iterm2 to have option key as Meta key (set profile's option key to +Esc)

# Install powerline font
git clone git@github.com:Lokaltog/powerline.git
git clone git@github.com:Lokaltog/powerline-fonts.git
# Install tomorrow-theme
git clone git@github.com:chriskempson/tomorrow-theme.git

# Install necessary python package
pip install pylint virtualenv virtualenvwrappers numpy scipy matplotlib scikit-learn ipython colout

easy_install ipython[zmq, qtconsole, notebook, test]

# Install oh-my-zsh
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh

# Symlink all dotfiles to home directories
#Configure git
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui true

# Configure vim
# Install vundle and necessary plugins
git clone https://github.com/gmarik/vundle.git

# Install ruby
brew install rbenv-default-gems rbenv-gem-rehash rbenv-vars
rbenv install 2.0.0-*
# Move default gem file to $RBENV_ROOT

# Install neccessary npm packages
npm -g install express derby yo grunt-cli bower less sass coffee-script jshint jsonlint csslint jade ejs stylus sails nodemon forever

# Install xcode package manager
git clone git@github.com:mneorr/Alcatraz.git

# PHP
# Install mamp, link file, download source
# Add pcntl and readline to MAMP's PHP
# Install composer

# Config to have caps lock as ctrl key
