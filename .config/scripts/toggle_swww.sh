#!/bin/sh

if pgrep -x "swww-daemon" >/dev/null; then
	killall swww-daemon
	dunstify -r 14 "Wallpaper" "Wallpaper off"
else
	swww-daemon &
	dunstify -r 15 "Wallpaper" "Wallpaper on"
fi
