#!/bin/sh

desc=$(calcurse -n | sed '1d;s_^\s*__;s_\[\(.*\):\(.*\)\]_\1h:\2m_')
[ -z "$desc" ] && printf " None" && exit
printf " $desc"
