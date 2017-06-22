#!/bin/bash

tmpFile="/tmp/.i3-songscroll"

status=$(playerctl status)
if [[ "$status" == 'Playing' ]]; then
  artist=$(playerctl metadata artist | sed 's/"/\\"/g')
  title=$(playerctl metadata title | sed 's/"/\\"/g')

  # scroll through song title
  string="$artist - $title"
  start=$(cat $tmpFile)
  let "start=start+5"
  let "end=start+45"

  if [ $end -ge ${#string} ]; then
      start=1
      let "end=start+"
  fi

  echo -n $start > $tmpFile

  stringShort=$(echo $string | cut -c$start-$end)


  echo -n " 𝅘𝅥𝅮 $stringShort" | iconv -c


fi
