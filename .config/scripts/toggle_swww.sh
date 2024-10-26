#!/bin/bash

if pgrep -x "swww-daemon" >/dev/null; then
	echo "swww-daemon sedang berjalan. Mematikan..."
	killall swww-daemon
else
	echo "swww-daemon tidak berjalan. Menyalakan..."
	swww-daemon &
fi
