#!/bin/sh

xautolock -detectsleep -time 5 -locker "betterlockscreen -l" &

FIRST_XAUTLOCK_PID=$!

(xautolock -detectsleep -time 10 -locker "loginctl suspend" &)

wait $FIRST_XAUTLOCK_PID
