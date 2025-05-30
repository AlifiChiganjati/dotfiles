#!/bin/sh

if [ -z "${XDG_RUNTIME_DIR}" ]; then
  # Set XDG_RUNTIME_DIR to /tmp/<UID>-runtime-dir, using $(id -u) in case $UID is not set
  export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"

  # Create the directory if it doesn't exist and set appropriate permissions
  if [ ! -d "${XDG_RUNTIME_DIR}" ]; then
    mkdir -p "${XDG_RUNTIME_DIR}"
    chmod 0700 "${XDG_RUNTIME_DIR}"
  fi
fi

dbus-run-session bspwm
