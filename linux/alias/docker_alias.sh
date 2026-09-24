# Docker and Docker Compose aliases

docker_compose() {
    if command -v docker >/dev/null 2>&1 &&
        docker compose version >/dev/null 2>&1; then
        docker compose "$@"
    elif command -v docker-compose >/dev/null 2>&1; then
        docker-compose "$@"
    else
        echo "No se encontro docker-compose ni docker compose" >&2
        return 1
    fi
}

_docker_compose_with_file() {
    local operation="$1"
    local compose_file="$2"
    shift 2

    if [ -n "$compose_file" ]; then
        docker_compose -f "$compose_file" "$operation" "$@"
    else
        docker_compose "$operation" "$@"
    fi
}

alias dc='docker_compose'

dcu() {
    if [ "$#" -eq 0 ]; then
        docker_compose up -d
    elif [ "$#" -eq 1 ]; then
        docker_compose -f "$1" up -d
    else
        echo "Usage: dcu [compose-file]" >&2
        return 2
    fi
}

dcd() {
    [ "$#" -le 1 ] || { echo "Usage: dcd [compose-file]" >&2; return 2; }
    _docker_compose_with_file down "${1:-}"
}

dcp() {
    [ "$#" -le 1 ] || { echo "Usage: dcp [compose-file]" >&2; return 2; }
    _docker_compose_with_file ps "${1:-}"
}

dcl() {
    [ "$#" -le 1 ] || { echo "Usage: dcl [compose-file]" >&2; return 2; }
    _docker_compose_with_file logs "${1:-}" -f
}

dcb() {
    [ "$#" -le 1 ] || { echo "Usage: dcb [compose-file]" >&2; return 2; }
    _docker_compose_with_file build "${1:-}"
}

dcr() {
    [ "$#" -le 1 ] || { echo "Usage: dcr [compose-file]" >&2; return 2; }
    _docker_compose_with_file restart "${1:-}"
}

dce() {
    if [ "$1" = "--file" ]; then
        if [ "$#" -lt 3 ]; then
            echo "Usage: dce [--file compose-file] service command" >&2
            return 2
        fi
        docker_compose -f "$2" exec "${@:3}"
    else
        docker_compose exec "$@"
    fi
}

alias dps='docker ps'
alias dpa='docker ps -a'
alias dimg='docker images'
alias dvls='docker volume ls'
alias dex='docker exec -it'
alias dlogs='docker logs -f'
alias dstop='docker stop'
alias dstart='docker start'
alias drm='docker rm'
alias drmi='docker rmi'
alias dvol='docker volume'
alias dnet='docker network'
