#!/usr/bin/env bash

PICTURE=/tmp/i3lock.png
SCREENSHOT="maim $PICTURE"

BLUR="10x5"

$SCREENSHOT
convert $PICTURE -blur $BLUR $PICTURE
i3lock -i $PICTURE
rm $PICTURE
