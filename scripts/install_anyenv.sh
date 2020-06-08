#!/bin/zsh

cd
brew install anyenv
mkdir -p $(anyenv root)/plugins
git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update

anyenv update

anyenv install nodenv
anyenv install pyenv
anyenv install tfenv

exec $SHELL -l

anyenv versions
