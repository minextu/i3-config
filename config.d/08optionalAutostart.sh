# wacom tablet
exec xsetwacom --set 8 Area 100 100 7045 3963
exec xsetwacom set "8" MapToOutput $mainMonitor
exec xsetwacom set "9" touch off
exec xsetwacom set "10" Button 1 "key down"
exec xsetwacom set "10" Button 3 "key up"

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
