# Autostart desktop programs
exec chromium
exec --no-startup-id i3-msg "workspace $workspace9; exec konsole"
exec dolphin
exec yakuake

# touchpad
exec --no-startup-id synclient TapButton1=1 TapButton2=3 TapButton3=2

# switch to workspace 1 again
exec --no-startup-id sleep 2; i3-msg workspace $workspace1
