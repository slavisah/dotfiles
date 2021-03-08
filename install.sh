#! /bin/bash
echo "Installing Mac Environment"
orig=$(pwd)

# Install brew 
#/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
cd $HOME
mkdir homebrew && curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C homebrew
cd $orig

# install brew packages
$HOME/homebrew/bin/brew bundle install --verbose

# install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

# Set up shell
#$HOME/homebrew/bin/brew install zsh
chsh -s "$(command -v zsh)"

# install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Symlink most important config file
ln -sv $orig/.zshrc ~
ln -sv $orig/.sandboxrc ~
ln -sv $orig/.mavenrc ~
