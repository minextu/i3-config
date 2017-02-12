# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango: Noto Sans 9, FontAwesome 9

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# colors
set $bg-color 	         #31363b
set $panel-active-color  #3daee9
set $inactive-bg-color   #31363b
set $text-color          #f3f4f5
set $inactive-text-color #676E7D
set $urgent-bg-color     #f47750
set $indicator-color	 #f47750

# window colors
#                       border              background         text                 indicator
client.focused          $bg-color           $bg-color          $text-color          $indicator-color
client.unfocused        $inactive-bg-color  $inactive-bg-color $inactive-text-color $indicator-color
client.focused_inactive $inactive-bg-color  $inactive-bg-color $inactive-text-color $indicator-color
client.urgent           $urgent-bg-color    $urgent-bg-color   $text-color          $indicator-color

# hide borders (smart = only if one window on desktop, both = disable completly)
hide_edge_borders smart

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command bash ~/.config/i3/panel/conky-i3bar.sh
        colors {
            background $bg-color
            separator #757575
            #                  border              background          text
            focused_workspace  $panel-active-color $panel-active-color $text-color
            inactive_workspace $inactive-bg-color  $inactive-bg-color  $inactive-text-color
            urgent_workspace   $urgent-bg-color    $urgent-bg-color    $text-color
        }
        position top
        tray_output $mainMonitor
}
