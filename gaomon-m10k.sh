#!/usr/bin/env bash
#set -e

MODEL_PAD="GAOMON Gaomon Tablet Pad pad"
MODEL_STRIP="GAOMON Gaomon Tablet Touch Strip pad"
MODEL_STYLUS="GAOMON Gaomon Tablet stylus"
MODEL_PAD_LOADED=$(xsetwacom list|grep "$MODEL_PAD")
MODEL_STRIP_LOADED=$(xsetwacom list|grep "$MODEL_STRIP")
MODEL_STYLUS_LOADED=$(xsetwacom list|grep "$MODEL_STYLUS")
if [ -z "$MODEL_PAD_LOADED" ]; then
	printf "$MODEL_PAD not detected" | systemd-cat -t gaemon-m10k.sh -p err
	exit 1
fi
if [ -z "$MODEL_STRIP_LOADED" ]; then
	printf "$MODEL_STRIP not detected" | systemd-cat -t gaemon-m10k.sh -p err
	exit 1
fi
if [ -z "$MODEL_STYLUS_LOADED" ]; then
	printf "$MODEL_STYLUS not detected" | systemd-cat -t gaemon-m10k.sh -p err
	exit 1
fi

# button 1
xsetwacom set "$MODEL_PAD" button 1 key G # gradient-tool

# button 2
xsetwacom set "$MODEL_PAD" button 2 key F # bucket-tool

# button 3
xsetwacom set "$MODEL_PAD" button 3 "key +ctrl +z -z -ctrl" # cancel

# button 4
xsetwacom set "$MODEL_PAD" button 8 key T

# button 5
xsetwacom set "$MODEL_PAD" button 9 key C

# button middle
xsetwacom set "$MODEL_PAD" button 10 key X

# button 6
xsetwacom set "$MODEL_PAD" button 11 key B # pencil-tool

# button 7
xsetwacom set "$MODEL_PAD" button 12 key O # increase opacity

# button 8
xsetwacom set "$MODEL_PAD" button 13 key I # decrease opacity

# button 9
xsetwacom set "$MODEL_PAD" button 14 "key +ctrl +plus -plus -ctrl" # zoom

# button 10
xsetwacom set "$MODEL_PAD" button 15 "key +ctrl +minus -minus -ctrl" # dezoom

# Wheel up
xsetwacom set "$MODEL_STRIP"  AbsWheelUp "key +ISO_Level3_Shift [ [ -ISO_Level3_Shift" # brush size decrease

# Wheel down
xsetwacom set "$MODEL_STRIP"  AbsWheelDown "key +ISO_Level3_Shift ] ] -ISO_Level3_Shift" # brush size increase

# Stylus
xsetwacom set "$MODEL_STYLUS" button 2 key E # eraser
exit 0
