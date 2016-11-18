#!/bin/sh
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/cask

brew install git
brew install mercurial
brew install fish
brew install python3
brew install node
brew install yarn

brew cask install iterm2
brew cask install google-chrome
brew cask install karabiner
brew cask install dropbox
brew cask install lastfm
brew cask install slack
brew cask install tunnelblick
