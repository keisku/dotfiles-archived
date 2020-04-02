### Git
alias g='git'
alias gini='git init'

# git clone(Cl)
gCl() {
  local repo name email prefix repo
  repo=$1
  name=$2
  email=$3
  repo=${repo#*:}
  cmd="git clone "
  prefix="git@github-private:"
  eval $cmd$prefix$repo
  repo=${repo%.*}
  repo=${repo#*/}
  eval "cd $repo"
  eval "git config --local user.name $name"
  eval "git config --local user.email $email"
}

# git config (cf)
alias gcf='git config -e'
alias gcfg='git config --global'
alias gcfl='git config --local'
alias gcfll='git config --local -l'
alias gcfset='git config --local user.name "kskumgk63"; git config --local user.email "keisuke.umegaki.630@gmail.com"'

# git add (a)
alias ga='git add .'
alias gac='git add . && git commit -m'

# git commit (c)
alias gc='git commit -m'
alias gcam='git commit --amend -m'

# git push (psh)
alias gpsh='git push origin'
alias gpshf='git push --force-with-lease origin'
alias gpshd='git push --delete origin'

# git pull(pl)
alias gpl='git pull origin'
alias gplr='git pull --rebase origin'

# git rebase(rb)
alias grb='git rebase -i'
alias grbc='git add .; git rebase --continue'
alias grbab='git rebase --abort'

# git fetch(F)
alias gF='git fetch --all'
alias gFp='git fetch -p'

# git checkout (C)
alias gCh='git checkout HEAD .'
alias gChb='git checkout -b'

# git stash (S)
alias gS='(){git stash save \"$1\" && git stash list}'
alias gSl='git stash list'
alias gSp='git stash pop'
alias gSa='(){git stash apply stash@\{$1\}}'
alias gSd='(){git stash drop stash@\{$1\} && git stash list}'
# git stash; git stash drop stash@{0}
alias gSdrop='git add .;git stash; git stash drop stash@{0}'

# git log (L)
alias gL='git log --oneline'

# git diff (Df)
alias gdf='git diff --histogram'

# git branch (b, B)
alias gbm='git branch -m'
alias gs='git status'
alias gb='git branch -a && git status'
alias gbd='git branch -D'
alias gbd-merged='git branch --merged|egrep -v "\*|develop|master"|xargs git branch -d'

# git reset(rs)
alias grs-h='git reset --hard HEAD^'
alias grs-s='git reset --soft HEAD^'
alias grs-master='git reset --hard origin/master'

# git revert(rv)
alias grv='git revert'
alias grv-n='(){git revert $1 --no-commit}'

# git cherry-pick(pick)
alias gpick='git cherry-pick'

# starghip を導入したのでコメントアウト　

# # Gitbブランチを表示させる
# # https://qiita.com/nishina555/items/f4f1ddc6ed7b0b296825

# # ここはプロンプトの設定なので今回の設定とは関係ありません
# if [ $UID -eq 0 ];then
# # ルートユーザーの場合
# PROMPT="%F{red}%n:%f%F{green}%d%f [%m] %%
# "
# else
# # ルートユーザー以外の場合
# PROMPT="%F{cyan}%n:%f%F{green}%d%f [%m] %%
# "
# fi

# # ブランチ名を色付きで表示させるメソッド
# function rprompt-git-current-branch {
#   local branch_name st branch_status

#   if [ ! -e  ".git" ]; then
#     # gitで管理されていないディレクトリは何も返さない
#     return
#   fi
#   branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
#   st=`git status 2> /dev/null`
#   if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
#     # 全てcommitされてクリーンな状態
#     branch_status="%F{green}"
#   elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
#     # gitに管理されていないファイルがある状態
#     branch_status="%F{red}?"
#   elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
#     # git addされていないファイルがある状態
#     branch_status="%F{red}+"
#   elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
#     # git commitされていないファイルがある状態
#     branch_status="%F{yellow}!"
#   elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
#     # コンフリクトが起こった状態
#     echo "%F{red}!(no branch)"
#     return
#   else
#     # 上記以外の状態の場合は青色で表示させる
#     branch_status="%F{blue}"
#   fi
#   # ブランチ名を色付きで表示する
#   echo "${branch_status}[$branch_name]"
# }
