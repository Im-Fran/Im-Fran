#/bin/sh

# Request sudo access (and update apt)
sudo apt update

# Install required packages
sudo apt install -y build-essential procps curl file git zsh keychain

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install brew taps from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/taps.sh)"

# Install brew packages from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/packages.sh)"

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Install oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Move the current ~/.zshrc file to a backup if it exists (to ~/.zshrc.bak)
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc-$(date +%Y%m%d).bak

# Generate new ~/.zshrc file
curl -o ~/.zshrc https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/ubuntu/zshrc
