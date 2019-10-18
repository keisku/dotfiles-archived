autoload -U compinit
compinit

# コマンドプロンプト
PROMPT='%F{cyan}%T%f %F{cyan}>%f%F{green}>%f%F{cyan}>%f '

# GOPATH
export GOENV_ROOT=$HOME/.goenv
eval "$(goenv init -)"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOENV_ROOT/bin:$PATH

