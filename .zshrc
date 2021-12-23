# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-vi-mode)

source $ZSH/oh-my-zsh.sh
source $HOME/.bash_profile


KEYTIMEOUT=1

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

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias vi='nvim'

export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/2.7.0/bin:$PATH"
export PATH="$HOME/.config/scripts:$PATH"
export PATH="$PATH:$HOME/fvm/default/bin" # Flutter global version as managed by fvm
export PATH="$PATH:$HOME/.config/scripts"
export PATH="$PATH":"$HOME/.pub-cache/bin"
export LC_CTYPE=en_US.UTF-8


eval "$(starship init zsh)"
