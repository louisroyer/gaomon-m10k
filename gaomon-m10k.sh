#!/usr/bin/env bash
#set -e

MODEL="GAOMON Gaomon Tablet Pad pad"
MODEL_LOADED=$(xsetwacom list|grep "$MODEL")
if [ -z "$MODEL_LOADED" ]; then
	printf "Tablet $MODEL not detected" | systemd-cat -t gaemon-m10k.sh -p err
	exit 1
fi

# button 1
xsetwacom set "$MODEL" button 1 key G

# button 2
xsetwacom set "$MODEL" button 2 key F

# button 3
xsetwacom set "$MODEL" button 3 key Ctrl Z

# button 4
xsetwacom set "$MODEL" button 8 key T

# button 5
xsetwacom set "$MODEL" button 9 key C

# button middle
xsetwacom set "$MODEL" button 10 key X

# button 6
xsetwacom set "$MODEL" button 11 key B

# button 7
xsetwacom set "$MODEL" button 12 key Ctlr +

# button 8
xsetwacom set "$MODEL" button 13 key Ctlr -

# button 9
xsetwacom set "$MODEL" button 14 key H

# button 10
xsetwacom set "$MODEL" button 15 key I
exit 0
