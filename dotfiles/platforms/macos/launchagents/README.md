# LaunchAgents

LaunchAgents versionados en este repo, más el sistema para sincronizarlos entre
`~/Library/LaunchAgents` y este dotfiles clone.

## Cómo funciona el sistema de sync

Los `.plist` se administran con `dotfiles/platforms/macos/scripts/launchagents-manager`
(se ejecuta con `runscript launchagents-manager <sync|link>`, ver
[../scripts/README.md](../scripts/README.md)):

1. **`manifest.txt`** — lista explícita de qué `.plist` trackear, uno por línea
   (`#` para comentarios). Nada se sincroniza si no está listado acá; evita
   arrastrar plists de apps de terceros sin querer.
2. **`sync`** — copia cada `.plist` listado en el manifest desde
   `~/Library/LaunchAgents` hacia esta carpeta del repo (`$DOTFILES_DIR/dotfiles/platforms/macos/launchagents/`,
   `$DOTFILES_DIR` por defecto es `~/.dotfiles`). Solo copia; el commit/push
   se hace a mano después de revisar el diff.
3. **`link`** — para cada `.plist` presente en el repo, crea (o reemplaza) un
   symlink en `~/Library/LaunchAgents/` y lo (re)carga con
   `launchctl bootout` + `launchctl bootstrap gui/<uid>`.

Flujo típico para agregar un LaunchAgent nuevo: crear/copiar el `.plist` acá,
agregar su nombre a `manifest.txt`, correr `runscript launchagents-manager link`.

## `cl.franciscosolis.brew-upgrader.plist`

Corre [`brew-upgrader`](../scripts/README.md#brew-upgrader) todos los días a
las 3:00 AM.

**Requiere que la Mac despierte sola**, ya que `StartCalendarInterval` solo
dispara el job si la máquina ya está despierta a esa hora — un LaunchAgent no
puede despertar el equipo por sí mismo. Para eso hay que agendar el wake a
nivel de sistema (una sola vez, persiste entre reinicios):

```bash
sudo pmset repeat wake MTWRFSU 02:55:00
```

Esto despierta la Mac a las 2:55 AM (5 minutos antes del job, para dar margen
a que la red esté arriba). Verificar con `pmset -g sched`; cancelar con
`sudo pmset repeat cancel`. Si la máquina está apagada (no dormida), esto no
la enciende.
