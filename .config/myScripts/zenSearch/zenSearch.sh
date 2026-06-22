#!/usr/bin/env zsh
pidof alacritty -s > "$HOME/.config/myScripts/zenSearch/pid"

read "?Search: " searchWhat
URL="https://duckduckgo.com/?q=$searchWhat"
zen-browser --blank-window $URL
return
