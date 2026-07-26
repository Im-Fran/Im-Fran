# Scripts (macOS)

Scripts específicos de macOS, ejecutados vía la función `runscript` definida
en [`zshrc`](../zshrc). `runscript <nombre> [args...]` busca primero en esta
carpeta (`dotfiles/platforms/macos/scripts/`) y si no encuentra el script
cae a `dotfiles/shared/scripts/`. En macOS la descarga usa la API de GitHub
(`api.github.com/repos/.../contents/...`) con `GITHUB_TOKEN`, cachea el
script en `~/.cache/runscript/` (comparando hash contra la copia remota) y lo
corre con `zsh`. Sin conexión a GitHub, usa la última copia cacheada si
existe. Sin argumentos, `runscript` lista los scripts disponibles separados
en "de macOS" y "compartidos" (o los cacheados localmente si no hay
conexión).

## `brew-upgrader`

```
runscript brew-upgrader
```

Actualiza Homebrew de forma no interactiva: `brew update`, luego actualiza
cada formula y cask desactualizado (`brew outdated --json=v2 --greedy`) uno
por uno. Si todo sale bien, solo imprime el resumen. Si algo falla, genera un
reporte con el paquete, el motivo del error y un comando sugerido para
arreglarlo a mano (`brew reinstall [--cask] <nombre>`); el reporte se
imprime y además se guarda en `~/.cache/runscript/brew-upgrade-report-<fecha>.txt`.

Pensado para correr a diario sin intervención vía el LaunchAgent
[`cl.franciscosolis.brew-upgrader.plist`](../launchagents/README.md).

## `launchagents-manager`

```
runscript launchagents-manager sync   # copia .plist desde ~/Library/LaunchAgents al repo
runscript launchagents-manager link   # symlinkea del repo a ~/Library/LaunchAgents y (re)carga
```

Sincroniza LaunchAgents entre `~/Library/LaunchAgents` y este dotfiles clone.
Solo toca los `.plist` listados explícitamente en
[`../launchagents/manifest.txt`](../launchagents/manifest.txt). Ver el
[README de launchagents](../launchagents/README.md) para el detalle del flujo.
