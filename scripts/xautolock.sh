#!/bin/bash

# Mengunci layar dengan betterlockscreen setelah 1 menit
xautolock -time 5 -locker "betterlockscreen -l" &

# Suspend setelah 2 menit
(sleep 600 && loginctl suspend) &
