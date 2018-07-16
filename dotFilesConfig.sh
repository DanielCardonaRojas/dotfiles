#!/usr/bin/env bash
if [ "$(uname)" != "Darwin" ]; then
	echo "This installation script is for macOS"
	return 1
fi
# ------------------ CLONE GITHUB REPO ---------------- #
echo "Cloning DanielCardonaRojas/dotfiles into home directory"
cd ~
git clone https://github.com/DanielCardonaRojas/dotfiles .

# ---------------- POWERLINE FONTS ------------- #
echo "Installing fonts"
git clone https://github.com/powerline/fonts.git --depth=1
./fonts/install.sh
rm -rf fonts

# ------------- CLI's --------------- #
echo "Installing Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing zsh"
brew install zsh zsh-completions
zsh --version
chsh -s $(which zsh)

echo "Installing ohmyzsh"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Installing plugin manager: Vim-Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "Installing neovim"
brew install neovim
nvim --version | head -n 1

echo "Installing tmux"
brew install tmux
tmux -V

echo "Installing hyperjs"
brew cask install hyperjs


echo "Now enter tmux and do Prefix + I to install plugins"
echo "Visit https://github.com/DanielCardonaRojas/dotfiles for a usage guide"
