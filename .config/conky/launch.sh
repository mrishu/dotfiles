#!/bin/sh

# Terminate already running conky instances
killall -q conky

# Wait until the processes have been shut down
while pgrep -u $UID -x conky >/dev/null; do sleep 1; done

conky -d -c ~/.config/conky/time.lua
#conky -d -c ~/.config/conky/agenda.lua

printf "Conky launched...\n"
