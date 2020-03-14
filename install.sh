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

echo "install git, zsh, tig, go, nodebrew, tmux"

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "install vim-plug"

source ~/dotfiles/.zshrc
