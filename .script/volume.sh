#!/bin/bash

# env
appname="system_info"
file=/tmp/volume_notification

# up / down / mute command
case "$1" in
  "up")
    wpctl set-volume @DEFAULT_SINK@ 5%+ 
    ;;
  "down")
    wpctl set-volume @DEFAULT_SINK@ 5%- 
    ;;
  "mute")
    wpctl set-mute @DEFAULT_SINK@ toggle
    ;;
esac

# check if output is muted or not
volume="$(wpctl get-volume @DEFAULT_SINK@ | sed -e 's/Volume: //' -e 's/\.//' -e 's/^0//')"
if [[ "$volume" == *"MUTED"* ]]; then
  isMuted="true"
else
  isMuted="false"
fi

# send custom notification
if [ "$isMuted" == "false" ]; then 
  if [ "$volume" -gt "100" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -h string:fgcolor:#ff4444 -h string:frcolor:#ff4444 -i notification-audio-volume-high -a $appname
  elif [ "$volume" -gt "65" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-high -a $appname
  elif [ "$volume" -gt "20" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-medium -a $appname
  elif [ "$volume" -gt "0" ]; then
    notify-send.sh --replace-file=$file "Volume $volume%" -h int:value:"$volume" -i notification-audio-volume-low -a $appname
  elif [ "$volume" == "0" ]; then
    notify-send.sh --replace-file=$file "Volume Muted" -i notification-audio-volume-muted -a $appname
  fi
else
  notify-send.sh --replace-file=$file "Volume Muted" -i notification-audio-volume-muted -a $appname
fi

# notification sound
canberra-gtk-play -i audio-volume-change -d "changeVolume"
