
#!/bin/sh
#AccuWeather (r) RSS weather tool for conky
#
#USAGE: weather.sh <locationcode>
#
#(c) Michael Seiler 2007

METRIC=1 #Should be 0 or 1; 0 for F, 1 for C

if [ -z $1 ]; then
    echo
    echo "USAGE: weather.sh <locationcode>"
    echo
    exit 0;
fi

out=`curl --connect-timeout 30 -s http://rss.accuweather.com/rss/liveweather_rss.asp\?metric\=${METRIC}\&locCode\=$1 | perl -ne 'if (/Currently/) {chomp;/\<title\>Currently: (.*)?\<\/title\>/; print "$1"; }'`
cond=`echo $out | cut -d':' -f 1`
temp=`echo $(echo $out | cut -d':' -f 2 | tr -d C)°C`

case "$cond" in

'Fog')
    cond="Nebel"
    echo -e " \c"
;;
'Snow')
    cond="Schnee"
    echo -e " \c"
;;
'Cloudy')
    cond="Bewölkt"
    echo -e " \c"
;;
'Sunny')
    cond="Sonnig"
    echo -e " \c"
;;
'Partly Sunny')
    cond="Teilweise sonnig"
    echo -e " \c"
;;
'Mostly Sunny')
    cond="Meist sonnig"
    echo -e " \c"
;;
'Showers')
    cond="Regenschauer"
    echo -e " \c"
;;
'Rain')
    cond="Regen"
    echo -e " \c"
;;
'Partly Cloudy')
    cond="Teilweise bewölkt"
    echo -e " \c"
;;
'Partly Cloudy W/ Showers')
    cond="Teilweise bewölkt + Regenschauer"
    echo -e " \c"
;;
'Mostly Cloudy')
    cond="Meist bewölkt"
    echo -e " \c"
;;
'Mostly Cloudy W/ Flurries')
    cond="Meist bewölkt + Windböen"
    echo -e " \c"
;;
'Mostly Cloudy W/ Showers')
    cond="Meist bewölkt + Schauer"
    echo -e " \c"
;;
'Intermittent Clouds')
    cond="Wechselnd bewölkt"
    echo -e " \c"
;;
'Flurries')
    cond="Windböen"
    echo -e " \c"
;;
'Clear')
    cond="Klar"
    echo -e " \c"
;;
'Mostly Clear')
    cond="Meist klar"
    echo -e " \c"
;;
*)
esac

echo -e $cond'\c'
echo : $temp
