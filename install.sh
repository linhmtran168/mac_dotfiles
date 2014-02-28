#!/bin/sh
# Install Xcode and command line tool
# Install homebrew
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"

# Tap additional repos
brew tap homebrew/dupes

# Install zsh and other packages
brew install rbenv zsh go python python3 scala sbt giter8 akka tmux wget openssl zsh-syntax-highlighting rethinkdb mongodb pyqt zmq svn erlang-r16 elixir leiningen casperjs ctags redis ack boris the_silver_searcher

# Install macvim
brew install macvim --override-system-vim

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

# Install prezto
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Symlink all dotfiles to home directories

#Configure git
git config --global alias.lg "log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
git config --global color.ui true

# Configure vim
# Install vundle and necessary plugins
git clone https://github.com/gmarik/vundle.git

# Install ruby
brew install chruby ruby-install direnv
ruby-install ruby $version
chruby $version

# Install nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
# Install nodejs
nvm install 0.10
nvm use 0.10
# Install necessary npm packages
npm -g install bower generator-kraken mocha browserify generator-mocha nodemon bytewiser generator-webapp coffee-script grunt pageres csslint grunt-cli pm2 cssmin gulp promise-it-wont-hurt envify harp protractor eslint ionic react-tools express jade sass expressworks jshint sequelize forever jsonlint tldr functional-javascript-workshop less uglifyjs generator-angular levelmeup yo generator-gulp-webapp meteorite generator-karma minify

# PHP
# Install mamp, link file, download source
# Add pcntl and readline to MAMP's PHP
# Install composer
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Config to have caps lock as ctrl key
