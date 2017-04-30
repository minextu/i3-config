# reload the configuration file
#bindsym $mod+Shift+c reload
bindsym $mod+Shift+c exec --no-startup-id bash ~/.config/i3/scripts/generateConfig.sh; reload

# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r exec --no-startup-id bash ~/.config/i3/scripts/generateConfig.sh; restart

# exit i3 (logs you out of your X session)
bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-msg exit'"

# power off, suspend...
set $mode_system System (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (p) power off
mode "$mode_system" {
    bindsym l exec --no-startup-id ~/.config/i3/scripts/i3exit.sh lock, mode "default"
    bindsym e exec --no-startup-id ~/.config/i3/scripts/i3exit.sh logout, mode "default"
    bindsym s exec --no-startup-id ~/.config/i3/scripts/i3exit.sh suspend, mode "default"
    bindsym h exec --no-startup-id ~/.config/i3/scripts/i3exit.sh hibernate, mode "default"
    bindsym r exec --no-startup-id ~/.config/i3/scripts/i3exit.sh reboot, mode "default"
    bindsym p exec --no-startup-id ~/.config/i3/scripts/i3exit.sh shutdown, mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+Pause mode "$mode_system"


# external monitor
set $mode_display Ext Screen (v) VGA ON, (h) HDMI ON, (x) VGA OFF, (y) HDMI OFF
mode "$mode_display" {
    bindsym v exec --no-startup-id xrandr --output VGA1 --auto --same-as $mainMonitor, mode "default"
    bindsym h exec --no-startup-id bash ~/.config/i3/scripts/switchHdmi.sh "$mainMonitor" "on", mode "default"
    bindsym x exec --no-startup-id xrandr --output VGA1 --auto --off, mode "default"
    bindsym y exec --no-startup-id bash ~/.config/i3/scripts/switchHdmi.sh "$mainMonitor" "off", mode "default"

    # back to normal: Enter or Escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}
bindsym $mod+p mode "$mode_display"

# program launcher
bindsym $mod+d exec albert toggle

# task manager
bindsym Control+Escape exec ksysguard
for_window [class="ksysguard"] floating enable

# screenshot
bindsym Print exec ~/Dokumente/bash/screenshot.sh

# start a terminal
bindsym $mod+Return exec konsole

# Pulse Audio controls
bindsym XF86AudioRaiseVolume exec --no-startup-id bash ~/.config/i3/scripts/volume.sh up
bindsym XF86AudioLowerVolume exec --no-startup-id bash ~/.config/i3/scripts/volume.sh down
bindsym XF86AudioMute exec --no-startup-id bash ~/.config/i3/scripts/volume.sh mute

# Sreen brightness controls
bindsym XF86MonBrightnessUp exec xbacklight -inc 5 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 5 # decrease screen brightness

# Media player controls
bindsym XF86AudioPause exec playerctl play-pause
bindsym XF86AudioPlay exec playerctl play-pause
bindsym XF86AudioNext exec playerctl next
bindsym XF86AudioPrev exec playerctl previous

# keyboard layout
bindsym $mod+k exec --no-startup-id bash ~/.config/i3/scripts/toggleKeymap.sh
