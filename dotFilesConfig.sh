#!/usr/bin/env bash

PURPLE='\033[0;35m'
NC='\033[0m' # No Color

if [ "$(uname)" != "Darwin" ]; then
    echo "This installation script is for macOS"
    return 1
fi

# ------------------ CLONE GITHUB REPO ---------------- #
echo "${PURPLE}Cloning DanielCardonaRojas/dotfiles into home directory${NC}"
git clone --bare https://github.com/DanielCardonaRojas/dotfiles $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config checkout


# ------------- CLI's --------------- #

echo "${PURPLE}Installing nix${NC}"
# Install nix package manager
sh <(curl -L https://nixos.org/nix/install)  --darwin-use-unencrypted-nix-store-volume


# Install home-manager
echo "${PURPLE}Installing home-manager${NC}"
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

echo "${PURPLE}Installing Homebrew${NC}"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "${PURPLE}Installing ohmyzsh${NC}"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "${PURPLE}Installing starship prompt${NC}"
sh -c "$(curl -fsSL https://starship.rs/install.sh)"


echo "${PURPLE}Installing tmux plugin manager${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm


echo "Now enter tmux and do Prefix + I to install plugins"
echo "Visit https://github.com/DanielCardonaRojas/dotfiles for a usage guide"
