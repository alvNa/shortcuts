# shortcuts

Shell aliases and utilities for Git, Maven, Docker, and common commands.

## Installation

Define la ubicación del repositorio y copia los alias a tu directorio personal.
Por defecto se espera que el repositorio esté en `${HOME}/shortcuts`. Si está
en otra ruta, como `/home/shortcuts`, cambia el valor de `SHORTCUTS_DIR`.

```bash
SHORTCUTS_DIR="${HOME}/shortcuts"
mkdir -p "$HOME/alias"
cp "$SHORTCUTS_DIR/linux/alias/"*.sh "$HOME/alias/"
```

Añade el loader del perfil de tu shell al fichero correspondiente. Si el
repositorio está en otra ruta, usa esa ruta absoluta en el `source`:

```bash
# Bash (shell de login): ~/.bash_profile
source "$HOME/shortcuts/linux/.bash_profile"

# Bash (terminal interactiva habitual en servidores): ~/.bashrc
source "$HOME/shortcuts/linux/.bash_profile"

# Zsh: ~/.zshrc
source "$HOME/shortcuts/linux/.zshrc"
```

Por ejemplo, si el repositorio está en `/home/shortcuts` pero `$HOME` es
`/root`:

```bash
SHORTCUTS_DIR="/home/shortcuts"
cp "$SHORTCUTS_DIR/linux/alias/"*.sh "$HOME/alias/"
echo 'source /home/shortcuts/linux/.bash_profile' >> "$HOME/.bash_profile"
```

En servidores que usan `~/.bashrc` para las terminales interactivas, añade la
misma línea a ese fichero:

```bash
echo 'source /home/shortcuts/linux/.bash_profile' >> "$HOME/.bashrc"
```

Si el servidor usa Zsh:

```bash
echo 'source /home/shortcuts/linux/.zshrc' >> "$HOME/.zshrc"
```

Recarga el perfil después de la instalación:

```bash
# Bash
source ~/.bash_profile

# Zsh
source ~/.zshrc
```

Comprueba qué shell estás usando con:

```bash
echo "$SHELL"
```

Si los alias se almacenan en una ruta distinta de `"$HOME/alias"`, actualiza
`alias_dir` en el loader del perfil antes de cargarlo. Si cambias de usuario,
instala los alias en el `$HOME` de ese usuario y configura su perfil
correspondiente.

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
