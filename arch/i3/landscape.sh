#!/bin/sh

#portrait (left)

xrandr -o normal
xinput set-prop "pointer:ELAN0732:00 04F3:22E1" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
xinput set-prop "Synaptics TM3257-001" --type=float "Coordinate Transformation Matrix" 0 0 0 0 0 0 0 0 0
