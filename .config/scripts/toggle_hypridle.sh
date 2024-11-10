#!/bin/sh

if pgrep -x "hypridle" >/dev/null; then
	killall hypridle
	dunstify -r 10 "Hypridle" "Disable"
else
	hypridle &
	dunstify -r 11 "Hypridle" "Enable"
fi

hyprctl reload
