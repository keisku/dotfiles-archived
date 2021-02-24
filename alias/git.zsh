### Git
alias g='git'
alias gini='git init'

# git config (cf)
alias gcf='git config -e'
alias gcfg='git config --global'
alias gcfl='git config --local'
alias gcfll='git config --local -l'
alias gcfset='git config --local user.name "kskumgk63"; git config --local user.email "keisuke.umegaki.630@gmail.com"'
alias gcfset-work='git config --local user.name "hrb-umegaki-keisuke"; git config --local user.email "umegaki.keisuke@hrbrain.co.jp"'

# git add (a)
alias ga='git add .'
alias gac='git add . && git commit -m'

# git commit (c)
alias gc='git commit -m'
alias gcam='git commit --amend -m'

# git push (psh)
alias gpsh='git push origin $(if [ -z $1 ]; then echo $(git branch --show-current); else echo $1; fi)'
alias gpshf='git push --force-with-lease origin $(if [ -z $1 ]; then echo $(git branch --show-current); else echo $1; fi)'

# git pull(pl)
alias gpl='git pull origin $(if [ -z $1 ]; then echo $(git branch --show-current); else echo $1; fi)'
alias gplr='git pull --rebase origin $(if [ -z $1 ]; then echo $(git branch --show-current); else echo $1; fi)'

# git merge(m)
alias gmrgc="git merge --continue"
alias gmrgab="git merge --abort"

# git rebase(rb)
alias grb='(){git rebase -i HEAD~$1}'
alias grbc='git add .; git rebase --continue'
alias grbab='git rebase --abort'

# git fetch(f)
alias gf='git fetch --all'
alias gfp='git fetch -p'

# git checkout (co)
alias gco-h='git checkout HEAD .'
alias gcob='git checkout -b'
alias gcoprev='git checkout -'

# git stash (s)
alias gs='(){git add .;git stash save \"$1\" && git stash list}'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsa='(){git stash apply stash@\{$1\}}'
alias gsd='(){git stash drop stash@\{$1\} && git stash list}'
alias gsclear='git stash clear'
alias gsdrop='git add .;git stash; git stash drop stash@{0}'

# git diff (df)
alias gdf='git diff --histogram'

# git branch (b)
alias gbm='git branch -m'
alias gb='git branch -a && git status'
alias gbd-merged='git branch --merged|egrep -v "\*|develop|master"|xargs git branch -d'

# git status (st)
alias gst='git status'

# git reset(rs)
alias grs-h='(){git reset --hard HEAD^$1}'
alias grs-s='(){git reset --soft HEAD^$1}'

# git revert(rv)
alias grv='git revert'
alias grv-n='(){git revert $1 --no-commit}'
alias grvc='git revert --continue'
alias grvab='git revert --abort'

# git cherry-pick(pk)
alias gpk='git cherry-pick'
alias gpkc='git cherry-pick --continue'
alias gpkab='git cherry-pick --abort'
alias gpkn='git cherry-pick -n'
alias gpke='git cherry-pick -e'

# git functions
gsyncto() {
  local targets target
  branches=$(git branch --all | grep -v HEAD)
  target=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m)
  target=$(echo "$target" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
  git branch -D $target
  git checkout -b $target
}

gsyncfromdefault() {
  local currentBranch
  currentBranch=$(git branch --show-current)
  local default
  default=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
  git checkout $default
  git pull --rebase origin $default
  git branch -D $currentBranch
  git checkout -b $currentBranch
}

gbdel() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

gco() {
  git fetch --all
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

glog() {
  git log --graph --color=always \
      --format="%C(auto)%h%d %s %C(black)%C(bold)%cr" "$@" |
  fzf --ansi --no-sort --reverse --tiebreak=index --bind=ctrl-s:toggle-sort \
      --bind "ctrl-m:execute:
                (grep -o '[a-f0-9]\{7\}' | head -1 |
                xargs -I % sh -c 'git show --color=always % | less -R') << 'FZF-EOF'
                {}
FZF-EOF"
}

gmrg() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git merge $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##") --no-ff
}

gplrupstream() {
  local default
  default=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
  git pull --rebase upstream $default
}

gplrdef() {
  local default
  default=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
  git pull --rebase origin $default
}

gcodef() {
  local default
  default=$(git remote show origin | grep 'HEAD branch' | awk '{print $NF}')
  git checkout $default
  git pull --rebase origin $default
}
