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

# Setelah reload, pastikan pengaturan monitor tetap
# Mengatur monitor eDP-1 setelah reload
hyprctl keyword monitor "eDP-1, 1920x1080@60, 0x0, 1"

# Mengatur monitor HDMI-A-1 jika terdeteksi
if hyprctl monitors | grep -q "HDMI-A-1"; then
	# Mengatur monitor eksternal HDMI-A-1
	hyprctl keyword monitor "HDMI-A-1,preferred,auto,auto"
fi
