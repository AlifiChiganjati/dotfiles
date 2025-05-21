#!/bin/sh

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'Mute: yes'; then
  pactl set-source-mute @DEFAULT_SOURCE@ 0
  dunstify -r 250 "Microphone" "Unmuted" -i microphone-sensitivity-high-symbolic
else
  pactl set-source-mute @DEFAULT_SOURCE@ 1
  dunstify -r 5 "Microphone" "Muted" -i microphone-sensitivity-muted-symbolic
fi
