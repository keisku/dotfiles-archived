autoload -U compinit
compinit

PROMPT='%F{cyan}%B[%T]%b%f %~ %F{cyan}%B›%b%f%F{cyan}%B›%b%f%F{cyan}%B›%b%f '

export GOENV_ROOT=$HOME/.goenv
export PATH=$GOENV_ROOT/bin:$PATH
export PATH=$HOME/.goenv/bin:$PATH
eval "$(goenv init -)"