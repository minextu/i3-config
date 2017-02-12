#!/bin/bash

audioPlaying=$(pacmd list-sink-inputs | grep -c 'state: RUNNING')
program=$(pacmd list-sink-inputs | sed -e ':a' -e 'N' -e '$!ba' -re 's/^.*state: RUNNING.*?application.name = "([^"]*).*$/\1/')


if [ $audioPlaying -gt 0 ]; then
    # delay xautolock
    xautolock -disable
    xautolock -enable

    #Check if DPMS is on. If it is, deactivate and reactivate again. If it is not, do nothing.
    dpmsStatus=`xset -q | grep -ce 'DPMS is Enabled'`
    if [ $dpmsStatus == 1 ];then
            xset -dpms
            xset dpms
    fi

    echo "  $program "
fi
