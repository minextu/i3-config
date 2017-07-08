#!/bin/bash

# install dependencies
sudo pacman -Sy --needed\
 i3-wm i3lock xautolock dunst wmctrl\
 conky ttf-font-awesome breeze breeze-gtk breeze-icons qt5-styleplugins papirus-icon-theme-git filelight dzen2 playerctl pamixer\
 feh compton albert network-manager-applet parcellite volnoti redshift lxqt-policykit \
 upower tlp brightnessctl

# generate config
./scripts/generateConfig.sh
