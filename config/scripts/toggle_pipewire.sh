#!/bin/sh

# Cek init system
INIT=$(ps -p 1 -o comm=)

# Fungsi notifikasi
notify() {
  dunstify -r "$1" "PipeWire" "$2"
}

# Fungsi start pipewire
start_pipewire() {
  if [ "$INIT" = "dinit" ]; then
    dinitctl start pipewire && notify 13 "Enable"
  elif [ "$INIT" = "systemd" ]; then
    systemctl --user start pipewire && notify 13 "Enable"
  else
    setsid pipewire >/dev/null 2>&1 &
    notify 13 "Enable"
  fi
}

# Fungsi stop pipewire
stop_pipewire() {
  if [ "$INIT" = "dinit" ]; then
    dinitctl stop pipewire && notify 12 "Disable"
  elif [ "$INIT" = "systemd" ]; then
    systemctl --user stop pipewire && notify 12 "Disable"
  else
    killall pipewire >/dev/null 2>&1
    notify 12 "Disable"
  fi
}

# Cek apakah pipewire sedang jalan
if pgrep -x "pipewire" >/dev/null; then
  stop_pipewire
else
  start_pipewire
fi
