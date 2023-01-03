#!/bin/zsh

# Creates a symlink folder to merge all projects into
# This is then used by "ta" script to create the fzf popup in tmux
# to filter through projects and create sessions quickly

UNIFIED_DIR="$HOME/projects"
rm -rf $UNIFIED_DIR
mkdir $UNIFIED_DIR


DIRS=($HOME/development/* $HOME/Documents/development/*)

for dir in "${DIRS[@]}"; do
  if test -d "$dir"; then
    echo "Merging $dir to $UNIFIED_DIR"
    ln -sf $dir $UNIFIED_DIR
  else
    echo "Skippihg $dir as does not exist"
  fi
done
