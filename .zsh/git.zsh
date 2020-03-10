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

# git push (P)
alias gP='git push origin'
alias gPf='git push --force-with-lease origin'
alias gPd='git push --delete origin'

# git rebase (R)
alias gR='git pull --rebase origin'
alias gRc='git add .; git rebase --continue'

# git pull(pl)
alias gpl='git pull origin'

# git fetch(F)
alias gF='git fetch --all'
alias gFp='git fetch -p'

# git checkout (C)
alias gC='git checkout'
alias gCh='git checkout HEAD .'
alias gChB='git checkout -b'

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

# git reset(R)
alias gRh='git reset --hard HEAD^'
alias gRs='git reset --soft HEAD^'

# git cherry-pick(CP)
alias gCP='git cherry-pick'

