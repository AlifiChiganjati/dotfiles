#!/bin/bash

# Toggle mute for the default sink
pactl set-sink-mute @DEFAULT_SINK@ toggle

# Check current mute status of the default sink
if pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'Mute: yes'; then
	dunstify "Volume" "Muted" -i audio-volume-muted
else
	dunstify "Volume" "Unmuted" -i audio-volume-high
fi
