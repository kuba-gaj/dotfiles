#!/bin/sh
xrandr --output eDP1 --mode 1920x1080 --pos 320x1440 --rotate normal
xrandr --output DP1 --off
xrandr --output DP1-1 --mode 2560x1440 --pos 0x0 --rotate normal
xrandr --output DP1-2 --primary --mode 2560x1440 --pos 2560x0 --rotate left
xrandr --output DP1-3 --off
xrandr --output DP2 --off
xrandr --output HDMI1 --off
xrandr --output HDMI2 --off
xrandr --output VIRTUAL1 --off
