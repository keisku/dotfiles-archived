# docker(dk)
alias dk='docker'

# docker ps(p)
alias dkp='docker ps'
alias dkpa='docker ps -a'

# docker rm
alias dkrm='docker rm'
alias dkrm-all='docker rm "docker ps -a -q"'
alias dkrmi-all='docker rmi $(docker images | awk "/^<none>/ { print $3 }")'

# docker inspect(i)
alias dki='docker inspect'
alias dki-env='docker inspect --format="{{range .Config.Env}}{{println .}}{{end}}"'
alias dki-ip='docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'

# docker stop(s)
alias dks='docker stop'
# docker volume
alias dkv='docker volume ls'
# volume - not linked to any container
alias dkrmv-nolink='docker volume ls -qf dangling=true | xargs docker volume rm'

# images(im)
alias dkim='docker images'
alias dkim-notag='docker images --filter "dangling=true"'
# rm images - no tagged
alias dkrmim-notag='docker images -qf dangling=true | xargs docker rmi'

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
