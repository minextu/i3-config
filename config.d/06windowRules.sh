# hide titlebar in chromium
for_window [class="Chromium"] border none
for_window [class="tv"] border none

# set some programs to floating
for_window [title="osu!" class="Wine"] floating enable
for_window [class="yakuake"] floating enable
#for_window [class="Steam"] floating enable

# force programs to workspace
assign [class="Chromium"] $workspace1
assign [class="dolphin"] $workspace2
assign [class="Steam"] $workspace3
assign [title="^PlayOnLinux$"] $workspace3
assign [class="Atom"] $workspace4
assign [class="tv"] $workspace6
assign [class="Thunderbird"] $workspace7
assign [class="TelegramDesktop"] $workspace8
assign [class="Spotify"] $workspace10
for_window [class="Spotify"] move to workspace $workspace10
