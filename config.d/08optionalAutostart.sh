# wacom tablet
exec_always xsetwacom --set "Wacom Intuos PT M Pen stylus" Area 100 100 7045 3963
exec_always xsetwacom set "Wacom Intuos PT M Pen stylus" MapToOutput $mainMonitor
exec_always xsetwacom set "Wacom Intuos PT M Finger touch" touch off
exec_always xsetwacom set "Wacom Intuos PT M Pad pad" Button 1 "key down"
exec_always xsetwacom set "Wacom Intuos PT M Pad pad" Button 3 "key up"

# Autostart desktop programs
exec chromium
exec spotify
exec telegram-desktop
exec konsole
exec atom
exec steam-native
exec playonlinux
exec thunderbird
exec dolphin
exec yakuake
