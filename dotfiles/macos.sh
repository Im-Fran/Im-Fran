#!/bin/bash

if [ ! -d "/Volumes/Development" ]; then
  echo "Please make sure to create the 'Development' volume!"
  exit 1
fi

# Install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Install brew taps from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/taps.sh)"

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash

# Move NVM to development volume
mv $HOME/.nvm /Volumes/Development/.nvm

# Create symlink for .nvm
ln -s /Volumes/Development/.nvm $HOME/.nvm

# Install SDKMAN
curl -s "https://get.sdkman.io" | bash

# Move SDKMAN to development volume
mv $HOME/.sdkman /Volumes/Development/.sdkman

# Install oh my zsh.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Create symlink for development volume
ln -s /Volumes/Development $HOME/Development

# Create scripts folder and symlink
mkdir /Volumes/Development/.scripts && ln -s /Volumes/Development/.scripts $HOME/.scripts

# Setup swift autocompletion
swift package completion-tool generate-bash-script > /Volumes/Development/.scripts/swift-completion-tool
chmod +x /Volumes/Development/.scripts/swift-completion-tool

# Move the current ~/.zshrc file to a backup if it exists (to ~/.zshrc.bak)
[ -f $HOME/.zshrc ] && mv $HOME/.zshrc $HOME/.zshrc-$(date +%Y%m%d).bak

# Generate new ~/.zshrc file
curl -o $HOME/.zshrc https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/macos/zshrc

# Load current zshrc
source $HOME/.zshrc

# Install node lts
nvm install --lts

# Upgrade npm 
npm i -g npm@latest

# Install github copilot cli
npm i -g @githubnext/github-copilot-cli

# Now enable yarn
corepack enable

# Install jdk 17.0.2 zulu
sdk install java 17.0.2-zulu

# Move all other files to development volume and create symlinks
[ -d $HOME/.yarn ] && mv $HOME/.yarn /Volumes/Development/.yarn && ln -s /Volumes/Development/.yarn $HOME/.yarn
[ ! -d $HOME/.yarn ] && mkdir /Volumes/Development/.yarn && ln -s /Volumes/Development/.yarn $HOME/.yarn

[ -d $HOME/.npm ] && mv $HOME/.npm /Volumes/Development/.npm && ln -s /Volumes/Development/.npm $HOME/.npm
[ ! -d $HOME/.npm ] && mkdir /Volumes/Development/.npm && ln -s /Volumes/Development/.npm $HOME/.npm

[ -d $HOME/.m2 ] && mv $HOME/.m2 /Volumes/Development/.m2 && ln -s /Volumes/Development/.m2 $HOME/.m2
[ ! -d $HOME/.m2 ] && mkdir /Volumes/Development/.m2 && ln -s /Volumes/Development/.m2 $HOME/.m2

[ -d $HOME/.docker ] && mv $HOME/.docker /Volumes/Development/.docker && ln -s /Volumes/Development/.docker $HOME/.docker
[ ! -d $HOME/.docker ] && mkdir /Volumes/Development/.docker && ln -s /Volumes/Development/.docker $HOME/.docker

[ -d $HOME/.gradle ] && mv $HOME/.gradle /Volumes/Development/.gradle && ln -s /Volumes/Development/.gradle $HOME/.gradle
[ ! -d $HOME/.gradle ] && mkdir /Volumes/Development/.gradle && ln -s /Volumes/Development/.gradle $HOME/.gradle

[ -d $HOME/.config ] && mv $HOME/.config /Volumes/Development/.config && ln -s /Volumes/Development/.config $HOME/.config
[ ! -d $HOME/.config ] && mkdir /Volumes/Development/.config && ln -s /Volumes/Development/.config $HOME/.config

[ -d $HOME/.cargo ] && mv $HOME/.cargo /Volumes/Development/.cargo && ln -s /Volumes/Development/.cargo $HOME/.cargo
[ ! -d $HOME/.cargo ] && mkdir /Volumes/Development/.cargo && ln -s /Volumes/Development/.cargo $HOME/.cargo
