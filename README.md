# shortcuts

Shell aliases and utilities for Git, Maven, Docker, and common commands.

## Installation

Copy the shell alias files to a directory in your home folder:

```bash
mkdir -p "$HOME/alias"
cp linux/alias/*.sh "$HOME/alias/"
```

Add the profile loader for your shell to the corresponding user profile. Replace
the repository path with the absolute path where this project is checked out:

```bash
# Bash: ~/.bash_profile
source /Users/alvna/Documents/github-alvNa/shortcuts/linux/.bash_profile

# Zsh: ~/.zshrc
source /Users/alvna/Documents/github-alvNa/shortcuts/linux/.zshrc
```

Reload the profile after installation:

```bash
# Bash
source ~/.bash_profile

# Zsh
source ~/.zshrc
```

If the alias files are stored somewhere other than `"$HOME/alias"`, update
`alias_dir` in the profile loader before sourcing it.

## Docker shortcuts

```bash
dcu                         # compose up -d
dcu mydockercomposefile     # compose -f mydockercomposefile up -d
dcd [compose-file]          # compose down
dcp [compose-file]          # compose ps
dcl [compose-file]          # compose logs -f
dcb [compose-file]          # compose build
dce service command          # compose exec
dce --file compose-file ...  # compose exec con fichero
dcr [compose-file]          # compose restart
dps                         # docker ps
dpa                         # docker ps -a
dex                         # docker exec -it
dlogs                       # docker logs -f
dstop                       # docker stop
dstart                      # docker start
drm                         # docker rm
drmi                        # docker rmi
dvol                        # docker volume
dnet                        # docker network
```

Los shortcuts de Compose detectan automáticamente si está disponible
`docker compose` o `docker-compose`, dando prioridad a Compose v2.
Los shortcuts que muestran `[compose-file]` aceptan el fichero como primer
argumento, por ejemplo `dcl docker-compose.prod.yml`. Para `dce`, usa
`--file` para evitar ambigüedades con el servicio:
`dce --file docker-compose.prod.yml app sh`.
