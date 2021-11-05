#!/bin/bash

set -e

export BAT_THEME=Dracula
SEARCH_PATH=$1

PREVIEW_CMD_STR="sed -E \"s/:/ /g\" | xargs sh -c 'bat --paging=never --color=always  --highlight-line=\"\$1\" -p \"\$0\"'"



OUTPUT=$(sk --ansi -i -c 'rg -i "{}" --color=always --line-number' --preview "echo {} | $PREVIEW_CMD_STR")
LOCATION=$(echo $OUTPUT | awk 'BEGIN{ FS = ":"}{ print($1)}')
LINE_NUMBER=$(echo $OUTPUT | awk 'BEGIN{ FS = ":"}{ print($2)}')
bat -p --paging=never $LOCATION --color=always | less -r
