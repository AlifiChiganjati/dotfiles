#!/bin/sh

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then

  # Set XDG_RUNTIME_DIR jika belum ada
  if [ -z "${XDG_RUNTIME_DIR}" ]; then
    export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
    [ ! -d "${XDG_RUNTIME_DIR}" ] && mkdir -p "${XDG_RUNTIME_DIR}" && chmod 0700 "${XDG_RUNTIME_DIR}"
  fi

  # Bersihkan wayland socket lama
  rm -f "${XDG_RUNTIME_DIR}/wayland-"*

  # Pastikan socket Wayland pakai wayland-0
  export WAYLAND_DISPLAY=wayland-0

  # Jalankan Hyprland via seatd-launch dan dbus-run-session
  exec dbus-run-session seatd-launch Hyprland
fi
