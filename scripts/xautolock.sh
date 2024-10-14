#!/bin/sh

xautolock -detectsleep -time 5 -locker "betterlockscreen -l" &

FIRST_XAUTLOCK_PID=$!

(xautolock -detectsleep -time 7 -locker "doas zzz" &)

wait $FIRST_XAUTLOCK_PID
