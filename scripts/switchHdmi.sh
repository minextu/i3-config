#!/bin/bash
mainMonitor=$1
status=$2

if [ $status = "clone" ]; then
    # clone screen
    xrandr --output HDMI-0 --mode 1920x1080 --rate 60.00 --same-as $mainMonitor
else
    # extend screen
    xrandr --output $mainMonitor --mode 1920x1080 --rate 60.00 --output HDMI-0 --mode 1920x1080 --rate 60.00 --right-of $mainMonitor
fi
