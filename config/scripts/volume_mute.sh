#!/bin/sh

pactl set-sink-mute @DEFAULT_SINK@ toggle

if pactl get-sink-mute @DEFAULT_SINK@ | grep -q 'Mute: yes'; then
	dunstify -r 6 "Volume" "Muted" -i audio-volume-muted
else
	dunstify -r 7 "Volume" "Unmuted" -i audio-volume-high
fi
