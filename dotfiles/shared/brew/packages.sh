#!/bin/bash

# Install homebrew global packages
brew install gh stripe/stripe-cli/stripe gradle

# Install non macos packages (any linux distro)
if [ "$(uname)" != "Darwin" *; then
  brew install zsh swift
fi
