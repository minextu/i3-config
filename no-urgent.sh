#!/bin/bash
# removes urgent status from all workpaces for the first 20 seconds

seconds=20
until [ $seconds -lt 0 ]; do
    let seconds-=1
    sleep 1

    for win in $(wmctrl -l | awk -F' ' '{print $1}'); do
        wmctrl -i -r $win -b remove,demands_attention;
    done
done
