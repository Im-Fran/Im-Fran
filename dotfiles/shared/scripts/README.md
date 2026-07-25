# Scripts (shared)

Scripts disponibles en cualquier plataforma, ejecutados vía la función
`runscript` definida en el `zshrc` de cada plataforma
([macOS](../../platforms/macos/zshrc), [Linux](../../platforms/linux/zshrc)).
`runscript <nombre> [args...]` cae acá cuando el script no existe en la
carpeta `scripts/` de la plataforma actual. El script se cachea en
`~/.cache/runscript/` y se corre con `zsh`; sin conexión a GitHub usa la
última copia cacheada si existe.

## `git-sync`

```
git-sync [-b <branch>]
```

Sincroniza la rama actual con una rama base (`dev` por defecto): hace
`checkout` + `pull` de la base, vuelve a la rama actual y hace `merge` de la
base sobre ella. Aborta si hay cambios sin commitear, si la rama base no
existe localmente, o si el merge tiene conflictos.

## `clean-merged-branches`

```
clean-merged-branches [--force] [-D]
```

Busca ramas locales que correspondan a un PR de GitHub ya mergeado (vía
`gh pr list`) y las borra. Por defecto es dry-run (solo muestra qué borraría);
`--force` borra de verdad, `-D` usa `git branch -D` en vez del `-d` seguro.
Nunca toca ramas remotas ni las protegidas (`dev`, `prod`, `main`, `master`).
Requiere `gh` autenticado y `jq`.

## `pwdg`

```
pwdg [-d N] [-a[=bool]] [-s[=bool]] [-u[=bool]] [-l[=bool]]
```

Generador de contraseñas basado en `openssl`. `-d` es el largo (default 14),
`-a`/`-s`/`-u`/`-l` controlan si incluye dígitos, símbolos, mayúsculas y
minúsculas (dígitos/mayúsculas/minúsculas activados por default, símbolos
desactivados).

## `webm2mp4`

```
webm2mp4 <input.webm>
```

Convierte un archivo `.webm` a `.mp4` con `ffmpeg` (escala a dimensiones
pares, 30fps), generando `<input>.mp4` en el mismo directorio.

## `install-flutter`

```
install-flutter
```

Instala Flutter corriendo un script externo (gist propio) que hace el setup
completo. Requiere `curl`.

## `jdgui`

```
jdgui
```

Descarga (si no existe ya una copia en `~/.jdgui`) el último release de
[JD-GUI](https://github.com/java-decompiler/jd-gui) desde GitHub y lo lanza.
Requiere `java`, `jq` y `curl`.
