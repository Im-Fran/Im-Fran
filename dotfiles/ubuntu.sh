#/bin/sh

# Request sudo access (and update apt)
sudo apt update

# Install required packages
sudo apt install -y build-essential procps curl file git

# Install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install brew packages from github required for the development.
brew install "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew-packages)"

# Move the current ~/.zshrc file to a backup if it exists (to ~/.zshrc.bak)
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc-$(date +%Y%m%d).bak

# Generate a new zshrc file
(echo '# Start of .zshrcfile'; echo; echo '# Init brew';echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"') >> ~/.zshrc

# Install oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
