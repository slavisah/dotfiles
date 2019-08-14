#! /bin/bash
echo "Installing Mac Environment"
orig=$(pwd)
# Symlink most important config file
ln -s orig/.zshrc ~
ln -s orig/.sandboxrc ~

# Install brew 
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

#git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

# Set up shell
brew install zsh
chsh -s "$(command -v zsh)"
