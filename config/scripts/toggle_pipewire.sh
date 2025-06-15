#!/bin/sh

if pgrep -x "pipewire" >/dev/null; then
  killall pipewire
  dunstify -r 12 "Pipewire" "Disable"
else
  pipewire &
  dunstify -r 13 "Pipewire" "Enable"
fi
