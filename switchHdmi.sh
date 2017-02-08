#!/bin/bash
mainMonitor=$1
status=$2

internalSink=0
hdmiSink=1

moveSink () {
    echo "Setting default sink to: $1";
    pacmd set-default-sink $1
    pacmd list-sink-inputs | grep index | while read line
    do
        echo "Moving input: ";
        echo $line | cut -f2 -d' ';
        echo "to sink: $1";
        pacmd move-sink-input `echo $line | cut -f2 -d' '` $1
    done
}

if [ $status = "on" ]; then
    # turn on screen
    xrandr --output HDMI1 --auto --same-as $mainMonitor
    # move all audio streams to hdmi
    moveSink $hdmiSink
else
    # turn off stream
    xrandr --output HDMI1 --off
    # move all streams back to internal sink
    moveSink $internalSink
fi
