# Scripts (Linux)

Scripts específicos de Linux, ejecutados vía la función `runscript` definida
en [`zshrc`](../zshrc). `runscript <nombre> [args...]` busca primero en esta
carpeta (`dotfiles/platforms/linux/scripts/`) y si no encuentra el script cae
a `dotfiles/shared/scripts/`. A diferencia de macOS, en Linux la descarga se
hace directo desde `raw.githubusercontent.com` (sin `GITHUB_TOKEN`), se
cachea en `~/.cache/runscript/` y se corre con `zsh`. Sin conexión a GitHub,
usa la última copia cacheada si existe.

## `update-discord-linux`

```
runscript update-discord-linux
```

Descarga e instala la última versión de Discord para Linux (`.deb`). Resuelve
la versión actual siguiendo el redirect de
`discord.com/api/download?platform=linux&format=deb`, se salta la descarga si
esa versión ya está instalada en `~/.config/discord/<version>`, instala con
`dpkg` (pide `sudo`) y lanza Discord al terminar si instaló una versión nueva.
