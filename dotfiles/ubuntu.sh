#/bin/sh

# Request sudo access (and update apt)
sudo apt update

# Now install curl if not present
sudo apt install -y curl git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages from github required for the development.
BREW_PACKAGES=$()
brew install "$BREW_PACKAGES"

# Install oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
