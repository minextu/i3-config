#!/bin/bash

# install dependencies
sudo pacman -Sy --needed\
 i3-wm i3lock xautolock\
 conky ttf-font-awesome filelight dzen2 playerctl pamixer \
 feh compton albert network-manager-applet parcellite volnoti redshift

# generate config
./generateConfig.sh
