#! /bin/bash

# install fish
brew install fish

# add fish to list of shells
fish_path=$(which fish)
sudo echo "$fish_path # move to the first in list" >>/etc/shells
sudo vim /etc/shells

# set fish as default shell
cd ~
basename $(pwd) | pbcopy
chsh -s /opt/homebrew/bin/fish $(pbpaste)
