#!/bin/sh

if pgrep -x "hypridle" >/dev/null; then
	killall hypridle
	dunstify -r 10 "Hypridle" "Disable"
	sleep 2
	hyprctl reload
else
	hypridle &
	dunstify -r 11 "Hypridle" "Enable"
	sleep 2
	hyprctl reload
fi
