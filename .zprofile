autoload -U compinit
compinit

PROMPT='%F{cyan}%B[%T]%b%f %~ %F{cyan}%B›%b%f%F{cyan}%B›%b%f%F{cyan}%B›%b%f '

# go
export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"
export PATH="$HOME/.cargo/bin:$PATH"

# python
export PYENV_ROOT="$HOME/.pyenv"
export PATH="PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
