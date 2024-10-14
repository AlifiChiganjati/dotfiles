#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'Mute: yes'; then
	dunstify "Volume" "Muted" -i audio-volume-muted
else
	dunstify "Volume" "Unmuted" -i audio-volume-high
fi
