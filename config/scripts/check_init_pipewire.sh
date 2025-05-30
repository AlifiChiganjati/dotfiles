#!/bin/sh

INIT=$(ps -p 1 -o comm=)

if [ "$INIT" = "dinit" ]; then
  dinit -q &
else
  pipewire &
fi
