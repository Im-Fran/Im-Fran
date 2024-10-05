#!/bin/bash

DEVELOPMENT_FOLDER="$HOME/Development"
if [ ! -d "$DEVELOPMENT_FOLDER" ]; then
  mkdir "$DEVELOPMENT_FOLDER"
fi


# Setup programs
if ! command -v brew &> /dev/null; then
  # Install homebrew
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Load homebrew
if [[ $(uname -p) == "arm" ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else 
  eval "$(/usr/local/bin/brew shellenv)"
fi

# Install brew taps from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/taps.sh)"

if [ ! -d $HOME/.oh-my-zsh ]; then
  # Install oh my zsh.
  export RUNZSH="no" 
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  
  # Install theme
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Create symlink for development volume
[ ! -d $HOME/Development ] && ln -s /Volumes/Development $HOME/Development

# Create scripts folder and symlink
[ ! -d $HOME/.scripts ] && mkdir $HOME/.scripts

# Setup swift autocompletion
swift package completion-tool generate-bash-script > $HOME/.scripts/swift-completion-tool
chmod +x $HOME/.scripts/swift-completion-tool

# Move the current ~/.zshrc file to a backup if it exists (to ~/.zshrc.bak)
[ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc-$(date +%Y%m%d).bak

# Generate new ~/.zshrc file
curl -o $HOME/.zshrc https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/macos/zshrc

# Load current zshrc
source $HOME/.zshrc

