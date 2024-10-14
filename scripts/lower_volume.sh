#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ -5%

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')

dunstify "Volume" "Decreased to $VOLUME" -i audio-volume-low
