#!/usr/bin/env zsh
pidof kitty -s > "$HOME/.config/myScripts/ff/pid"

PID=$(cat "$HOME/.config/myScripts/ff/pid")

#if ps -p $PID > /dev/null; then
#  echo "Process $PID is running."
#else
#  echo "I should not be albe to see this (:"
#fi
#echo $(cat "$HOME/.config/myScripts/ff/pid")

fastfetch
read -k -s "?Press any key to close..."
return
