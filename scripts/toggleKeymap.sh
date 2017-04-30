#!/bin/bash
currentLayout=$(setxkbmap -query | grep layout | sed 's/layout:     //')

if [ "$currentLayout" == "de" ]; then
    setxkbmap -layout gb
else
    setxkbmap -layout de -variant nodeadkeys
fi
