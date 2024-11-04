#!/bin/sh

if pgrep -x "swww-daemon" >/dev/null; then
	killall swww-daemon
else
	swww-daemon &
fi
