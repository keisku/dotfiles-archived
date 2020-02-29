# docker(dk)
alias dk='docker'

# docker ps(p)
alias dkp='docker ps'
alias dkpa='docker ps -a'

# docker stop(s)
alias dks='docker stop'
# docker volume
alias dkv='docker volume ls'
# volume - not linked to any container
alias dkrmv-nolink='docker volume ls -qf dangling=true | xargs docker volume rm'

# images
alias dki='docker images'
alias dki-notag='docker images --filter "dangling=true"'
# rm images - not tagged
alias dkrmi-notag='docker images -qf dangling=true | xargs docker rmi'

# docker system df - show ammount to use
alias dksysdf='docker system df'

# docker-compose
alias dkc='docker-compose'
# docker-compose ps(dkcp)
alias dkcp='docker-compose ps'
# docker-compose up(dkcup)
alias dkcup-re='docker-compose up --force-recreate -d  --remove-orphans'
# docker-compose buld(dkcb)
alias dkcb='docker-compose build --no-cache'

# docker network (dkn)
alias dknls='docker network ls'
alias dkni='docker network inspect'
alias dknc='docker network connect'
alias dkndc='docker network disconnect'
