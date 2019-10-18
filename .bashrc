# Unix

# search
alias sch='mdfind -onlyin ~/ -name'

## code
alias codealias='code ~/dotfiles/.bashrc'

## ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -l -a'
alias lssh='ls -a ~/.ssh/'

## rm
alias rm='rm -i'

# zsh
alias vizpro='vim ~/.zprofile'
alias szpro='source ~/.zprofile'
alias vizrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'

## bash
alias vimbpro='vim ~/.bash_profile'
alias catbpro='cat ~/.bash_profile'
alias bpro='~/.bash_profile'
alias brc='~/.bashrc'
alias sbpro='source ~/.bash_profile'
alias sbrc='source ~/.bashrc'
alias s='source'
alias vimbrc='vim ~/.bashrc'
alias catbrc='cat ~/.bashrc'

## less
alias moregiconf='more .git/config'

# cd
alias cdbengal='cd go/1.13.1/src/github.com/hrbrain/bengal-api'
alias ..='cd ..'

# git
alias gi='git'
alias giini='git init'
alias giclo='git clone'
# git add
alias giadd='git add'
alias giad='git add .'
# git commit
alias gic='git commit -m'
alias giadc='git add . && git commit -m'
alias giame='git commit --amend -m' # コミットメッセージを修正
#git push
alias gipsh='git push origin HEAD'
alias giph-f='git push -f origin HEAD'
# git rebase
alias gipl-re='git pull --rebase origin master'
alias gireconti='git rebase --continue'
#git checkout
alias gich='git checkout'
alias gich-b='git checkout -b'
# git branch / git status
alias gib='echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ && 
            git config branch.$(git rev-parse --abbrev-ref ${1:-@}).description &&
            echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ &&
            git branch -a'
alias gibmemo='git branch --edit-description' # ブランチにメモを残せる
# git branch -m "newname" - カレントブランチのブランチ名を修正する
# git branch -m "old" "new" - ブランチのブランチ名を修正する
alias gibm='git branch -m'
alias gib-d='git branch -D'
alias gis='git status'
alias gisb='echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ &&
            git config branch.$(git rev-parse --abbrev-ref ${1:-@}).description &&
            echo -+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+ &&
            git branch -a && git status'
# git log
alias gilog='git log'
alias gil='git log --oneline'
# git diff
alias gidiff='git diff --histogram' # HEAD~ - 1つ前のコミットと比べる
# git remote
alias giremote='git remote -v'
alias giseturl='git remote set-url origin'
# git config
alias giconf='git config'
alias giconf-gl='git config --global'
alias giconf-lo='git config --local'
# git reset
# ^HEAD - 1つ前のコミットまで戻る
# ハッシュ値 - 指定したハッシュ値のコミットまで戻る
alias gireset-h='git reset --hard'
# ハッシュ値 - 指定したハッシュ値のコミットまで戻る
alias gireset-s='git reset --soft'
alias gireset='git reset'
# git stash
alias gista='git stash'
alias gistals='git stash list' # 退避リストが見れる
alias gipop='git stash pop' # 退避を戻す
alias gistaap='git stash apply' # 退避を戻す
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
