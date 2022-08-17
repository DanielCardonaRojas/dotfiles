# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile


KEYTIMEOUT=1

# Custom functions
path() {
  echo $PATH | tr -s ':' '\n'
}

# Search with fzf and open with neovim (find file)
ff() {
  local selected_file=$(fzf)

  if ! [ -z $selected_file ]; then
    nvim $selected_file
  fi
}

fs() {
  skat # In ~/.config/scripts
}

lzc() {
  lazygit --git-dir=$HOME/.cfg --work-tree=$HOME
}

installNvimConfig() {
  ~/.config/scripts/install_nvim_config.sh
}

gif-mov() {
   movie=$1
   height=$(mdls -name kMDItemPixelHeight ${movie} | grep -o '[0-9]\+')
   width=$(mdls -name kMDItemPixelWidth ${movie} | grep -o '[0-9]\+')
   dimensions="${width}x${height}"
   # ffmpeg -i ${movie} -s ${dimensions} -pix_fmt rgb24 -vf "scale=-2:600" -r 10 -f gif ${movie}.gif
   # ffmpeg -i ${movie} -pix_fmt rgb24 -vf "scale=-2:600" -r 10 -f gif ${movie}.gif
   ffmpeg -i ${movie} -vf "fps=10,scale=-2:600:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" ${movie}.gif
}

mp4() {
  name=$(echo $1 | cut -d'.' -f1)
  ffmpeg -i $1 ${name}.mp4
}

# Bookmark directories
if [ -d "$HOME/.bookmarks" ]; then
  export CDPATH=".:$HOME/.bookmarks:/"
fi

bookmark() {
  local currentdir=$(basename $PWD)
  local bookmark_alias="@${1:-$currentdir}"

  if ! [ -d "$HOME/.bookmarks" ]; then
    mkdir ~/.bookmarks
    export CDPATH=".:$HOME/.bookmarks:/"
  fi

  echo "Creating bookmark $bookmark_alias for $PWD"
  ln -s $PWD "$HOME/.bookmarks/$bookmark_alias"

}

# Aliases

alias cd='cd -P'
alias g='lazygit'
alias goto="cd -P"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi='nvim'

# Exports

export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$PATH:$HOME/fvm/default/bin" # Flutter global version as managed by fvm
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export LC_CTYPE=en_US.UTF-8
export VISUAL=nvim
export EDITOR=nvim


eval "$(starship init zsh)"
