#!/bin/bash

# Increase volume by 10%
pactl set-sink-volume @DEFAULT_SINK@ +5%

# Get the current volume level
VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}')

# Send notification
dunstify "Volume" "Increased to $VOLUME" -i audio-volume-high
