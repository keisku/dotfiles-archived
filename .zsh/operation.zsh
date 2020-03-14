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
alias lesszrc='less ~/.zshrc'

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

# cd
alias ..='cd ..'
setopt auto_cd
setopt auto_pushd

# プロンプトが表示されるたびにプロンプト文字列を評価、置換する
setopt prompt_subst

# プロンプトの右側(RPROMPT)にメソッドの結果を表示させる
RPROMPT='`rprompt-git-current-branch`'
export PATH="/usr/local/sbin:$PATH"

# 前のコマンドと同じ場合履歴に残さない
setopt HIST_IGNORE_DUPS
