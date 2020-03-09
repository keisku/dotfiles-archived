#!/bin/zsh

# add submodule
git submodule update --init --recursive

# symlink dotfiles
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.vim ~/.vim
ln -sf ~/dotfiles/.tigrc ~/.tigrc

# change shell
chsh -s $(which zsh)

source ~/dotfiles/.zshrc
