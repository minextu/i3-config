# Start redshift in auto mode, fallback to trier if it fails to detect gps
exec --no-startup-id redshift || redshift -l 49.75:6.64

# start volnoti (volume notification)
exec --no-startup-id volnoti

# start compton
exec compton --config ~/.config/i3/compton.conf

# set desktop background
exec_always --no-startup-id feh --randomize --bg-fill ~/Bilder/Hintergruende/neu/ --bg-fill ~/Bilder/Hintergruende/neu/

# set xorg parameters
exec --no-startup-id xset s off # disable screen saver
exec --no-startup-id xset dpms 0 0 1500 # turn off screen after 25 minutes
exec --no-startup-id xset m 0 # disable mouse acceleration
exec --no-startup-id xautolock -time 30 -locker "~/.config/i3/scripts/i3exit.sh suspend" # auto suspend after some time
exec --no-startup-id setxkbmap -layout de -variant nodeadkeys # set keyboard layout

# start application runner
exec albert

# network manager
exec nm-applet

# clipboard manager
exec parcellite

# polkit agent
exec --no-startup-id lxqt-policykit-agent

# dolphin file indexer
exec baloo_file

# don't mark workspaces as urgent at startup
exec --no-startup-id bash ~/.config/i3/scripts/no-urgent.sh
