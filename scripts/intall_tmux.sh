#!/bin/zsh

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
mv .tmux/.tmux.conf.local ./dotfiles/
ln -s ./dotfiles/.tmux.conf.local .
