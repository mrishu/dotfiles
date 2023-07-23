#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# For bspwm-mode module
[ -e /tmp/bspwm.fifo ] && rm /tmp/bspwm.fifo
mkfifo /tmp/bspwm.fifo
bspc subscribe report > /tmp/bspwm.fifo &

# Launch bar
echo "---" | tee -a /tmp/polybar.log
polybar mybar 2>&1 | tee -a /tmp/polybar.log & disown

echo "Bars launched..."
