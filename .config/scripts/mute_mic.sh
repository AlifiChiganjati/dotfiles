#!/bin/bash

if pactl get-source-mute @DEFAULT_SOURCE@ | grep -q 'Mute: yes'; then
	pactl set-source-mute @DEFAULT_SOURCE@ 0
	dunstify "Microphone" "Unmuted" -i microphone
else
	pactl set-source-mute @DEFAULT_SOURCE@ 1
	dunstify "Microphone" "Muted" -i microphone
fi
