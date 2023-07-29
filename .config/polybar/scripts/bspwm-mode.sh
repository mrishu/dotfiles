#!/bin/sh

# Add the following lines to ~/.config/polybar/launch.sh 
# after killing and before launching polybar -->

#mkfifo /tmp/bspwm.fifo
#bspc subscribe report > /tmp/bspwm.fifo

# Also make sure that bspwm.fifo is updated after layout change. (Use 'bspc wm -g > /tmp/bspwm.fifo')
# In general 'bspc subscribe report > /tmp/bspwm.fifo' will handle the job if nodes are being manipulated.
# But while changing layout in 'single_monocle' when there is only one window, 
# 'bspc subscribe report' does not produce output, which needs to be handled manually.

# Desktop layouts
tiled="[]="
monocle() {
  printf "[$(bspc query -N -n .window -d focused | wc -l)]" # [Number of windows in current desktop]
}

# Node states
pseudo_tiled=", Pseudo"
floating=", ><>"
fullscreen=", Full"

# Node flags
sticky=" | Sticky"
private=" | Private"
locked=" | Locked"
marked=" | Marked"

while read -r report; do
  desktop_layout=$(printf "%s" "$report" | awk -F ":" '{print $(NF-2)}')
  node_state=$(printf "%s" "$report" | awk -F ":" '{print $(NF-1)}')
  node_flags=$(printf "%s" "$report" | awk -F ":" '{print $(NF)}')

  case "$desktop_layout" in
    LT) printf "$tiled" ;;
    LM) userLayout=$(bspc query -T -d | sed 's/.*userLayout":"\([^"]*\)".*/\1/')
      [ "$userLayout" = "tiled" ] && printf "$tiled" || monocle
      ;;
  esac

  case "$node_state" in
    TP) printf "$pseudo" ;;
    TF) printf "$floating" ;;
    T=) printf "$fullscreen" ;;
  esac

  if printf "%s\n" "$node_flags" | grep -q '^G.*S.*$'; then
    printf "$sticky"
  fi
  if printf "%s\n" "$node_flags" | grep -q '^G.*P.*$'; then
    printf "$private"
  fi
  if printf "%s\n" "$node_flags" | grep -q '^G.*L.*$'; then
    printf "$locked"
  fi
  if printf "%s\n" "$node_flags" | grep -q '^G.*M.*$'; then
    printf "$marked"
  fi

  printf "\n"
done < /tmp/bspwm.fifo
