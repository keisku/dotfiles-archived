# laod files under .zsh.d 
ZSHHOME="${HOME}/dotfiles/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

source ~/.zprofile
# fzf インストール時に更新したやつ
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
