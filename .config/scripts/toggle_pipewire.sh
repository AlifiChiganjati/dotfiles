#!/bin/sh

if pgrep -x "pipewire" >/dev/null; then
	killall pipewire
	dunstify -r 12 "pipewire" "pipewire disabled"
else
	pipewire &
	dunstify -r 13 "pipewire" "pipewire enabled"
fi
