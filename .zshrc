### fzf
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}
# fh - repeat history
fh() {
  eval $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
}
# fch - checkout git branch (including remote branches)
fch() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
# fshow - git commit browser
fshow() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

### Unix
## code
alias dots='code ~/dotfiles'

## ls
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -l -a'
alias lssh='ls -a ~/.ssh/'

# zsh
alias vizpro='vim ~/.zprofile'
alias szpro='source ~/.zprofile'
alias vizrc='vim ~/.zshrc'
alias szrc='source ~/.zshrc'

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
alias cdbengal='cd go/1.13.1/src/github.com/hrbrain/bengal-api'
alias ..='cd ..'

### git
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
alias giph-f='git push --force-with-lease origin HEAD'
alias gipsh-d='git push --delete origin' # ブランチ名の指定が必要
# git rebase
alias gipl-re='git pull --rebase origin master'
alias gireconti='git rebase --continue'
#git checkout
alias gich='git checkout'
alias gich-b='git checkout -b'
# git branch / git status
alias gib='git branch -a'
alias gibmemo='git branch --edit-description' # ブランチにメモを残せる
alias gibshow='git config branch.$(git rev-parse --abbrev-ref ${1:-@}).description'
# git branch -m "newname" - カレントブランチのブランチ名を修正する
# git branch -m "old" "new" - ブランチのブランチ名を修正する
alias gibm='git branch -m'
alias gib-d='git branch -D'
alias gis='git status'
alias gib='git branch -a && git status'
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
# マージしたけどやめたいとき
alias giabort='git merge --abort' # マージしたらコンフリクトしたのでやめる
alias gireset='git reset --hard HEAD' # コンフリクトを解消したけどやめる
alias gireset='git reset'
# git stash
alias gista='git stash'
alias gistals='git stash list' # 退避リストが見れる
alias gipop='git stash pop' # 退避を戻す
alias gistaap='git stash apply' # 退避を戻す

# Gitbブランチを表示させる
# https://qiita.com/nishina555/items/f4f1ddc6ed7b0b296825

# ここはプロンプトの設定なので今回の設定とは関係ありません
if [ $UID -eq 0 ];then
# ルートユーザーの場合
PROMPT="%F{red}%n:%f%F{green}%d%f [%m] %%
"
else
# ルートユーザー以外の場合
PROMPT="%F{cyan}%n:%f%F{green}%d%f [%m] %%
"
fi

# ブランチ名を色付きで表示させるメソッド
function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    # gitで管理されていないディレクトリは何も返さない
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    # 全てcommitされてクリーンな状態
    branch_status="%F{green}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    # gitに管理されていないファイルがある状態
    branch_status="%F{red}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    # git addされていないファイルがある状態
    branch_status="%F{red}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    # git commitされていないファイルがある状態
    branch_status="%F{yellow}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    # コンフリクトが起こった状態
    echo "%F{red}!(no branch)"
    return
  else
    # 上記以外の状態の場合は青色で表示させる
    branch_status="%F{blue}"
  fi
  # ブランチ名を色付きで表示する
  echo "${branch_status}[$branch_name]"
}

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
export PATH="/usr/local/sbin:$PATH"

# 前のコマンドと同じ場合履歴に残さない
setopt HIST_IGNORE_DUPS

# 'cd' なしで移動する
setopt auto_cd
setopt auto_pushd

source ~/.zprofile
# fzf インストール時に更新したやつ
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
