#!/bin/bash

set -e
monname=$(xrandr | grep connected | head -1 | cut -d " " -f 1)
cvtout=$(cvt $1 $2)
modeline=$(echo "$cvtout" | grep Modeline)
modestr=$(echo "$modeline" | sed "s/Modeline\s//g")
modename=$(echo "$modestr" | cut -d " " -f 1)
xrandr --newmode $modestr
xrandr --addmode $monname $modename
xrandr --output $monname --mode $modename
