# Unix

## code
alias codealias='code ~/dotfiles/.bashrc'

## ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -l -a'
alias lssh='ls -a ~/.ssh/'

## rm
alias rm='rm -i'

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
alias cdbengal='cd go/src/bengal-api'
alias ..='cd ..'

# Git
alias gi='git'
alias giini='git init'
alias giclo='git clone'
alias gic='git commit -m'
alias giadc='git add . && git commit -m'
alias gib='git branch -a'
# git branch -m "newname" - カレントブランチのブランチ名を修正する
# git branch -m "old" "new" - ブランチのブランチ名を修正する
alias gibm='git branch -m'
alias gis='git status'
alias gisb='git branch -a && git status'
alias gilog='git log'
alias gil='git log --oneline'
alias gipsh='git push origin'
alias gipl-re='git pull --rebase'
alias giadd='git add'
alias giad='git add .'
alias gich='git checkout'
alias gich-b='git checkout -b'
alias gib-d='git branch -D'
alias gidiff='git diff --histogram'
alias giremote='git remote -v'
alias giseturl='git remote set-url origin'
alias giconf='git config'
alias giconf-gl='git config --global'
alias giconf-lo='git config --local'
# ^HEAD - 1つ前のコミットまで戻る
# ハッシュ値 - 指定したハッシュ値のコミットまで戻る
alias gireset='git reset --hard'
# コミットメッセージを修正
alias giame='git commit --amend -m'
# コミット後の更新されていない内容を退避
alias gista='git stash'
# 退避リストが見れる
alias gistals='git stash list'
# 退避を戻す
alias gipop='git stash pop'