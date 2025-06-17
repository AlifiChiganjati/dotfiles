#!/bin/sh

# Set XDG_RUNTIME_DIR if not set
if [ -z "${XDG_RUNTIME_DIR}" ]; then
  export XDG_RUNTIME_DIR="/tmp/$(id -u)-runtime-dir"
  [ ! -d "${XDG_RUNTIME_DIR}" ] && mkdir -p "${XDG_RUNTIME_DIR}" && chmod 0700 "${XDG_RUNTIME_DIR}"
fi

dbus-run-session bspwm
