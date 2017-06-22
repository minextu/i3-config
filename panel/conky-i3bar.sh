#!/bin/sh
panelColor="#30353a"
panelSecondColor="#3daee9"
dzenArgs="-y 20 -fg #6c6c6c -bg $panelColor -fn Monospace:size=10
 -p -ta c -e onstart=uncollapse;button1=exit;button3=exit"

# Send the header so that i3bar knows we want to use JSON:
echo '{"version" : 1, "click_events": true }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[],'

# Now send blocks with information forever:
exec conky -c ~/.config/i3/panel/conkyrc &

currentMode="None"
# read click events
while read; do
    # extract name of clicked element
    name=$(echo $REPLY | sed -re 's/.*"name":"([^"]*)".*/\1/')
    x=$(echo $REPLY | sed -re 's/.*"x":([^,]*),.*/\1/')
    killall dzen2

    if [ $currentMode != $name ]; then
        case $name in
            "date")
                currentMode=$name

                calX=$(expr $x - 80)
                TODAY=$(expr `date +'%d'` + 0)
                MONTH=`date +'%m'`
                YEAR=`date +'%Y'`

                (
                echo "^bg($panelColor)^fg(#ffffff) Datum";

                # current month, hilight header and today
                cal | sed -re "s/^(.*[A-Za-z][A-Za-z]*.*)$/^fg($panelSecondColor)^bg($panelColor)\1/;
                s/(^|[ ])($TODAY)($|[ ])/\1^bg($panelSecondColor)^fg($panelColor)\2^fg(#6c6c6c)^bg($panelColor)\3/"
                ) | dzen2 $dzenArgs -x $calX -w 160 -l 7 &
                ;;
            "weather")
                firefox "http://www.accuweather.com/de/de/trier/54290/hourly-weather-forecast/171045?lang=de" &> /dev/null &
                 ;;
            "updates")
                konsole -e "bash -c 'sudo pacman -Syu; read -rsp $\"Ende...\" key'"
                ;;
            "space")
                filelight /home &> /dev/null &
                ;;
            "battery")
                currentMode=$name
                batX=$(expr $x - 150)
                (
                    echo "^bg($panelColor)^fg(#ffffff) Batterie";
                    # strip min, low and high values
                    upower -i $(upower -e | grep 'BAT')
                ) | dzen2 $dzenArgs -l 20 -x $batX -w 300 &
                ;;
            "temp")
                currentMode=$name
                tempX=$(expr $x - 100)
                (
                    echo "^bg($panelColor)^fg(#ffffff) Temperaturen";
                    # strip min, low and high values
                    sensors |  sed -r 's/([^\(]*).*/\1/'
                ) | dzen2 $dzenArgs -l 20 -x $tempX -w 200 &
                ;;
        esac
    else
        currentMode="None"
    fi
done
