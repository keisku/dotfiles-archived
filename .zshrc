# laod files under .zsh.d
ZSHHOME="${HOME}/dotfiles/alias"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

# starship コマンドプロンプトをおしゃれにするやつ
eval "$(starship init zsh)"

source ~/.zprofile
# fzf インストール時に更新したやつ
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
