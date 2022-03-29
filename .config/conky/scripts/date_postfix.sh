#!/bin/sh

d=$(date '+%d')

case $1 in
	11) printf "th" ;;
	12) printf "th" ;;
	13) printf "th" ;;
	*1) printf "st" ;;
	*2) printf "nd" ;;
	*3) printf "rd" ;;
	*) printf "th" ;;
esac
