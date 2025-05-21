#!/bin/sh

xrandr --output eDP-1 --mode 1920x1080

if xrandr -q | grep 'HDMI-1 connected'; then
	xrandr --output HDMI-1 --mode 1366x768 --right-of eDP-1

	bspc monitor eDP-1 -d 1 2 3 4 5
	bspc monitor HDMI-1 -d 6 7 8 9 10
else
	bspc monitor eDP-1 -d 1 2 3 4 5 6 7 8 9 10
fi
