#!/bin/bash

file=/tmp/output_toggle

outputs=$(swaymsg -t get_outputs --raw | jq -r '.[] | .name')
len=$(echo -e "$outputs" | wc -l)

if [ "$len" -gt "1" ]; then
  selected=$(echo -e "$outputs" | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.widget)
  if [ "$selected" != "" ]; then
    swaymsg output "$selected" toggle
    notify-send.sh --replace-file=$file "Outputs Control" "Toggling output $selected" -i video-display
  fi
else
  notify-send.sh --replace-file=$file "Outputs Control" "There's only one output display" -i video-display
fi
