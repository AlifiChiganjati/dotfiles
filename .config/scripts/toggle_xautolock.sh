#!/bin/sh

if pgrep -x "xautolock" >/dev/null; then
	killall xautolock
	dunstify -r 16 "Xautolock" "Disable"
else
	~/.config/scripts/xautolock.sh &
	dunstify -r 15 "Xautolock" "Enable"
fi
