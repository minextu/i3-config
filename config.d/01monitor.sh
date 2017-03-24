<<<<<<< HEAD
set $mainMonitor "eDP1"
=======
# monitor config
set $mainMonitor DisplayPort-0
set $secondMonitor DVI-0

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
exec --no-startup-id xrandr --output $mainMonitor --mode 1920x1080 --rate 60.00 --output $secondMonitor --mode 1600x1200 --rate 60.00 --left-of $mainMonitor
exec --no-startup-id xrandr --output $mainMonitor --primary
>>>>>>> 6deaf50958be5d23f30d3f6ae5527d842071de71
