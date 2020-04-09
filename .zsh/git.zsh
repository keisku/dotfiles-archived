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

# git fetch(f)
alias gf='git fetch --all'
alias gfp='git fetch -p'

# git checkout (ch)
alias gch='git checkout HEAD .'
alias gchb='git checkout -b'

# git stash (s)
alias gs='(){git stash save \"$1\" && git stash list}'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsa='(){git stash apply stash@\{$1\}}'
alias gsd='(){git stash drop stash@\{$1\} && git stash list}'
alias gsclear='git stash clear'
alias gsdrop='git add .;git stash; git stash drop stash@{0}'

# git log (l)
alias gl='git log --oneline -n 15'
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

# git diff (df)
alias gdf='git diff --histogram'

# git branch (b, B)
alias gbm='git branch -m'
alias gb='git branch -a && git status'
alias gbd='git branch -D'
gbdel() {
  local branches branch
  branches=$(git branch --all | grep -v HEAD) &&
  branch=$(echo "$branches" |
           fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
  git branch -D $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}
alias gbdel-merged='git branch --merged|egrep -v "\*|develop|master"|xargs git branch -d'
alias gbclean='(){git checkout master;git pull --rebase origin master;git checkout $1}'

# git status (st)
alias gst='git status'

# git reset(rs)
alias grs-h='git reset --hard HEAD^'
alias grs-s='git reset --soft HEAD^'
alias grs-master='git reset --hard origin/master'

# git revert(rv)
alias grv='git revert'
alias grv-n='(){git revert $1 --no-commit}'

# git cherry-pick(pk)
alias gpk='git cherry-pick'
alias gpkc='git cherry-pick --continue'
alias gpkab='git cherry-pick --abort'
alias gpkn='git cherry-pick -n'
alias gpke='git cherry-pick -e'
