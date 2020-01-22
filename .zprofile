autoload -U compinit
compinit

PROMPT='%F{cyan}%B[%T]%b%f %~ %F{cyan}%B›%b%f%F{cyan}%B›%b%f%F{cyan}%B›%b%f '

# go
export GOENV_DISABLE_GOPATH=1 # go env 解除
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# nodebrew
export PATH=$HOME/.nodebrew/current/bin:$PATH 

