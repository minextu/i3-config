#!/bin/bash

# install dependencies
sudo pacman -Sy --needed\
 i3-wm i3lock xautolock notify-osd\
 conky ttf-font-awesome numix-icon-theme-git filelight dzen2 playerctl pamixer\
 feh compton albert network-manager-applet parcellite volnoti redshift\
 upower tlp

# generate config
./generateConfig.sh
