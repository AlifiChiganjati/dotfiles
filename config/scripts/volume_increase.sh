#!/bin/sh

pactl set-sink-volume @DEFAULT_SINK@ +5%

VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '{print $5}' | sed 's/%//')

if [ "$VOLUME" -gt 100 ]; then
	pactl set-sink-volume @DEFAULT_SINK@ 100%
	VOLUME=100
fi

dunstify -r 4 "Volume" "Increased to $VOLUME%" -i audio-volume-high
