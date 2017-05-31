#!/usr/bin/env bash


# -------------- CHECK MINIMAL DEPENDENCIES  --------------- #
echo "Checking git installation"
which git || { echo "Git is not installed please install it first" ; exit 1; }
echo "Checking vim installation"
which vim || { echo "Vim is not installed please install it first" ; exit 1; }
echo "Checking curl installation"
which curl || { echo "curl is not installed please install it first" ; exit 1; }


# ---------------------- CLONE GITHUB REPO ------------------------ #
echo "Cloning DanielCardonaRojas/dotfiles into home directory"
cd ~
git init && git remote add origin https://github.com/DanielCardonaRojas/dotfiles
git pull origin master

# ---------------------- INSTALL VIM PLUGIN MANAGER ------------------------ #
echo "Installing plugin manager: Vim-Plug"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#Mac or Linux? store in variable
if [ "$(uname)" == "Darwin" ]; then
    # Do something under Mac OS X platform        
	echo "Detected operating system: macOS"
	echo "Installing Plugin YouCompleteMe dependencies "
	brew install cmake
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Detected operating system: Linux"
	echo "Installing Plugin YouCompleteMe dependencies "
	sudo apt-get install cmake
	sudo apt-get install python-dev python3-dev
	echo "Installing figlet"
	sudo apt-get install figlet
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then #Exit on windows, no support for windows
    # Do something under 32 bits Windows NT platform
	echo "Detected operating system: Windows NT"
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
    # Do something under 64 bits Windows NT platform
	echo "Detected operating system: Windows NT"; exit 1
fi


# TODO: Find a way to run  ":PlugInstall" from outside of vim
echo "Quit vim with (:q) after plugin installation is over"
read -p "Press any key to continue"
vim -c PlugInstall

echo "Installing YouCompleteMe"
cd ~/.vim/plugged/YouCompleteMe
git submodule update --init --recursive
./install.py --clang-completer 
cd ~
# ---------------------- INSTALL POWERLINE FONTS ------------------------ #
echo "Installing powerline fonts"
git clone https://github.com/powerline/fonts.git
./fonts/install.sh
rm -rf fonts

# ---------------------- INSTALL TMUX 2.3 ------------------------ #
echo "Installing tmux 2.3"
if [ "$(uname)" == "Darwin" ]; then
	brew install ctags
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	sudo apt-get remove tmux
	sudo apt-get install exuberant-ctags cmake libevent-dev libncurses5-dev
fi

echo "Downloading tmux 2.3 source"
wget https://github.com/tmux/tmux/releases/download/2.3/tmux-2.3.tar.gz
tar xvzf tmux-2.3.tar.gz
chmod +x tmux-2.3/*
cd tmux-2.3
./configure && make
sudo make install
echo "Tmux version now on:"
tmux -V
echo "Cloning tmux tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
echo "Cleaning up"
rm -r ~/tmux-2.3*

echo "Now enter tmux and do Prefix + I to install plugins"
echo "Visit https://github.com/DanielCardonaRojas/dotfiles for a usage guide"
echo "Setup terminal to use a powerline font to get a good looking Vim"
