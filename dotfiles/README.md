# dotfiles

Bootstrap scripts to get a fresh machine ready for development, plus the shared (`shared/`) and per-platform (`platforms/`) files they consume.

## `linux.sh`

Bootstrap for Linux (Debian/Ubuntu, via `apt`):

1. Installs base packages via `apt`: `build-essential procps curl file git zsh keychain jq`.
2. Installs [Homebrew](https://brew.sh) if not present.
3. Installs the shared brew taps and packages (`shared/brew/taps.sh` and `shared/brew/packages.sh`, fetched from GitHub).
4. Installs Oh My Zsh + the Powerlevel10k theme if not present.
5. Creates `~/.scripts` and generates `swift package` autocompletion.
6. Backs up the existing `~/.zshrc` (`~/.zshrc-YYYYMMDD.bak`) and downloads the one from `platforms/linux/zshrc`.
7. Reloads the shell with the new `.zshrc`.

Usage:

```sh
sh linux.sh
```

## `macos.sh`

Bootstrap for macOS:

1. Creates `~/Development` if it doesn't exist.
2. Installs Homebrew if not present and loads it based on architecture (`arm` vs Intel).
3. Installs the shared brew taps (`shared/brew/taps.sh`).
4. Installs Oh My Zsh + the Powerlevel10k theme if not present.
5. Symlinks `~/Development` to `/Volumes/Development` if that volume exists and the symlink doesn't.
6. Creates `~/.scripts` and generates `swift package` autocompletion.
7. Backs up the existing `~/.zshrc` (`~/.zshrc-YYYYMMDD.bak`) and downloads the one from `platforms/macos/zshrc`.
8. Reloads the shell with the new `.zshrc`.

Usage:

```sh
bash macos.sh
```

## Related structure

- `shared/brew/` — brew taps and packages common to all platforms.
- `shared/scripts/` — shared utility scripts.
- `platforms/linux/`, `platforms/macos/`, `platforms/windows/` — per-platform `zshrc`, aliases, scripts, and configuration.
