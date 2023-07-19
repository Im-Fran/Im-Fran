#/bin/sh

# Request sudo access (and update apt)
sudo apt update

# Install required packages
sudo apt install -y build-essential procps curl file git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages from github required for the development.
brew install "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew-packages)"

# Install oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
