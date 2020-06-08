#!/bin/zsh

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# brew install
brew install git
brew install zsh
chsh -s $(which zsh)
brew install starship
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/
git clone https://github.com/zsh-users/zsh-autosuggestions ~/

brew install tig
brew insall go
brew install nodebrew
brew install tmux

source ~/dotfiles/.zshrc
