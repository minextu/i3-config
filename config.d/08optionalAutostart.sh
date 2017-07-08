# wacom tablet
exec_always --no-startup-idxsetwacom --set "Wacom Intuos PT M Pen stylus" Area 100 100 7045 3963
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Pen stylus" MapToOutput $mainMonitor
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Pen stylus" Button 1
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Pen stylus" Button 2 "button 3"
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Pen stylus" Button 3 "button 3"
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Finger touch" touch off
exec_always --no-startup-idxsetwacom set "Wacom Intuos PT M Pad pad" Button 1 "key +XF86AudioLowerVolume"
exec_always --no-startup-id xsetwacom set "Wacom Intuos PT M Pad pad" Button 3 "key +XF86AudioRaiseVolume"

# Autostart desktop programs
exec firefox
exec chromium "http://youtube.com" --new-window "http://tv.et.tc" --user-data-dir=/home/jan/.config/chromium/tv --class="tv"
exec spotify
exec telegram-desktop
exec --no-startup-id i3-msg "workspace $workspace9; exec konsole"
exec atom
exec playonlinux
exec thunderbird
exec dolphin
exec --no-startup-id yakuake

# show workspace 8
exec --no-startup-id sleep 4; i3-msg workspace $workspace8
# switch to workspace 1 again
exec --no-startup-id sleep 5; i3-msg workspace $workspace1
