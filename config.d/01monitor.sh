# monitor config
set $mainMonitor DVI-0
set $secondMonitor DVI-1

# move workspace to correct monitor
workspace $workspace1 output $mainMonitor
workspace $workspace2 output $mainMonitor
workspace $workspace3 output $mainMonitor
workspace $workspace4 output $mainMonitor

workspace $workspace7 output $secondMonitor
workspace $workspace8 output $secondMonitor
workspace $workspace9 output $secondMonitor
workspace $workspace10 output $secondMonitor

# init monitors
exec --no-startup-id xrandr --output $mainMonitor --mode 1920x1080 --rate 60.00 --output $secondMonitor --mode 1600x1200 --rate 60.00 --left-of $mainMonitor
exec --no-startup-id xrandr --output $mainMonitor --primary
