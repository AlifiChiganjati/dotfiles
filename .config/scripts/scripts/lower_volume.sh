#!/bin/sh

pactl set-sink-volume @DEFAULT_SINK@ -5%

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')

dunstify -r 3 "Volume" "Decreased to $VOLUME" -i audio-volume-low
