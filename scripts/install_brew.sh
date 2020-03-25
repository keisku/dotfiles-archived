#!/bin/zsh

# add submodule
git submodule update --init --recursive

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
echo "install homebrew"

# brew install
brew install git
brew install zsh
chsh -s $(which zsh)

brew install tig
brew insall go
brew install nodebrew
brew install tmux
brew install pyenv
brew install tfenv

source ~/dotfiles/.zshrc
