# ログインシェルが ~/.bashrc を読み込んでくれる
if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# 出力の後に改行を入れる
function add_line {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}
PROMPT_COMMAND='add_line'

# git ブランチを表示する
# 下記ソースをコピペした
# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
source ~/.git-prompt.sh
export PS1='\[\e[1;37;42m\] [\A] \w \[\e[0m\] \e[1;32m\] $(__git_ps1 "(%s) " )\[\e[0m\] \e[1;32m\]$ \[\e[0m\]'

# GOPATH
export GOENV_ROOT=$HOME/.goenv
eval "$(goenv init -)"

export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOENV_ROOT/bin:$PATH

