#!/bin/sh

if hyprctl monitors | grep "HDMI-A-1"; then
	hyprctl keyword monitor "HDMI-A-1,preferred,auto,auto"
	hyprctl keyword monitor "eDP-1,disable"
else
	hyprctl keyword monitor "eDP-1,preferred,auto,auto"
fi
