#!/bin/zsh
LAYOUT=$(yabai -m query --spaces --space | jq '.type')
echo "current layout: $LAYOUT"

if [[ $LAYOUT == *"bsp"* ]]; then
	echo "change to stack"
	yabai -m space --layout stack
else
	echo "change to bsp"
	yabai -m space --layout bsp
fi
