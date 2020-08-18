#! /bin/bash
echo "Installing Mac Environment"
orig=$(pwd)
# Symlink most important config file
ln -sv $orig/.zshrc ~
ln -sv $orig/.sandboxrc ~
ln -sv $orig/.mavenrc ~

# Install brew 
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install brew packages
brew bundle

#git clone https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
git clone https://github.com/bhilburn/powerlevel9k.git ~/powerlevel9k

# Set up shell
brew install zsh
chsh -s "$(command -v zsh)"

# install SDKMAN
curl -s "https://get.sdkman.io" | bash
