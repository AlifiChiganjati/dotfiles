#!/bin/sh

if pgrep -x "hypridle" >/dev/null; then
	killall hypridle
	dunstify "Hypridle" "Disable"
else
	hypridle &
	dunstify "Hypridle" "Enable"
fi

hyprctl reload
