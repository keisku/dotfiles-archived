# docker(d)
alias d='docker'

# docker ps(ps)
alias dps='docker ps'
alias dpsa='docker ps -a'

# docker build(dbd)
alias dbd='docker build ./'
alias dbd-t='docker build ./ -t'

# docker run(drun)
alias drun='docker run -d -p'

# docker rm
alias drm='docker rm'
alias drm-all='docker rm "docker ps -a -q"'
alias drmi-all='docker rmi $(docker images | awk "/^<none>/ { print $3 }")'

# docker inspect(ins)
alias dins='docker inspect'
alias dins-env='docker inspect --format="{{range .Config.Env}}{{println .}}{{end}}"'
alias dins-ip='docker inspect --format="{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}"'

# docker stop(stop)
alias dstop='docker stop'
alias dstop-all='docker stop $(docker ps -q)'
# docker volume(vl)
alias dvlls='docker volume ls'
# volume - not linked to any container
alias drmvl-nolink='docker volume ls -qf dangling=true | xargs docker volume rm'

# images(im)
alias dim='docker images'
alias dim-notag='docker images --filter "dangling=true"'
# rm images - no tagged
alias drmim-notag='docker images -qf dangling=true | xargs docker rmi'

# docker system df - show ammount to use
alias dsysdf='docker system df'

# docker-compose
alias dc='docker-compose'
# docker-compose ps(dcp)
alias dcps='docker-compose ps'
# docker-compose up(dcup)
alias dcup='docker-compose up -d'
alias dcup-re='docker-compose up --force-recreate -d --remove-orphans'
# docker-compose down(dcdown)
alias dcdown='docker-compose down --remove-orphans'
# docker-compose restart(dcrestart)
alias dcrestart='docker-compose restart'
# docker-compose buld(dcbd)
alias dcbd='docker-compose build'
alias dcbd-nocache='docker-compose build --no-cache'
# docker-compose logs(dkclogs)
alias dclogs='docker-compose logs -ft'

# docker network (dnet)
alias dnetls='docker network ls'
alias dnetins='docker network inspect'
alias dnetconn='docker network connect'
alias dnetdisconn='docker network disconnect'

dclean() {
    docker rmi $(docker images | awk "/^<none>/ { print $3 }")
    docker images -qf dangling=true | xargs docker rmi
    docker volume ls -qf dangling=true | xargs docker volume rm
}
