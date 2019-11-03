# shellファイルには権限を付ける

```
chmod 755 xxxx.sh
```

# ユーザーにYes/Noをもとめたいとき

```
# 関数で定義しちゃったほうが楽。
# シェルの返り値は基本的には終了コードと同一の扱いなので
# Yesのときは0、Noのときは1を返すようにしている。
# ちなみに文字列を返したい場合は print して `` で実行する。
# 別に返してるわけじゃないけどね！
 askYesOrNo() {
    while true ; do
        read -p "$1 (y/n)?" answer
        case $answer in
            [yY] | [yY]es | YES )
                return 0;;
            [nN] | [nN]o | NO )
                return 1;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

# 使い方
askYesOrNo "Vim をインストールしますか？"
if [ $? -eq 0 ]; then
    # シェルスクリプトの返り値は終了コードを取る`$?`で取得
    yes | sudo apt-get install vim
else
    echo "Emacs派ですか、そうですか。念のためインストールしておきますね。"
    yes | sudo apt-get install vim
fi
```