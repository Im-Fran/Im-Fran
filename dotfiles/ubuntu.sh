#/bin/sh

# Request sudo access (and update apt)
sudo apt update

# Install required packages
sudo apt install -y build-essential procps curl file git zsh keychain

# Install brew
if ! command -v brew &> /dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # Load homebrew
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# Install brew taps from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/taps.sh)"

# Install brew packages from github required for the development.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/brew/packages.sh)"

# Install oh my zsh.
if [ ! -d $HOME/.oh-my-zsh ]; then
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  # Install theme
  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

# Create scripts folder and symlink
[ ! -d $HOME/.scripts ] &&mkdir /Volumes/Development/.scripts && ln -s /Volumes/Development/.scripts $HOME/.scripts

# Setup swift autocompletion
swift package completion-tool generate-bash-script > ~/.scripts/swift-completion-tool
chmod +x ~/.scripts/swift-completion-tool

# Move the current ~/.zshrc file to a backup if it exists (to ~/.zshrc.bak)
[ -f ~/.zshrc ] && mv ~/.zshrc ~/.zshrc-$(date +%Y%m%d).bak

# Generate new ~/.zshrc file
curl -o ~/.zshrc https://raw.githubusercontent.com/Im-Fran/Im-Fran/main/dotfiles/ubuntu/zshrc

# Load current zshrc
source ~/.zshrc

# Now enable yarn
corepack enable
