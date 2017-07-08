# monitor config
set $mainMonitor DVI-I-1
set $secondMonitor DVI-D-0
set $tv HDMI-0

# move workspace to correct monitor
workspace $workspace1 output $mainMonitor
workspace $workspace2 output $mainMonitor
workspace $workspace3 output $mainMonitor
workspace $workspace4 output $mainMonitor

workspace $workspace6 output $secondMonitor
workspace $workspace7 output $secondMonitor
workspace $workspace8 output $secondMonitor
workspace $workspace9 output $secondMonitor
workspace $workspace10 output $secondMonitor

# init monitors
exec_always --no-startup-id xrandr --output $mainMonitor --mode 1920x1080 --rate 60.00
exec_always --no-startup-id xrandr --output $secondMonitor --mode 1600x1200 --rate 60.00 --left-of $mainMonitor
exec_always --no-startup-id xrandr --output $tv --mode 1920x1080 --rate 60.00 --same-as $mainMonitor
exec_always --no-startup-id xrandr --output $mainMonitor --primary
