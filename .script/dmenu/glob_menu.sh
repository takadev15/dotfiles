#!/bin/bash

entries=$(cat ~/.script/dmenu/commandlist)
script=~/.script
selected=$(echo -e "$entries" | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.widget)

case $selected in
  "Restart Kanshi")
    exec kanshictl reload
    ;;
  "Color Picker")
    exec hyprpicker --autocopy
    ;;
  "Screenshot Menu")
    exec $script/screenshot.sh
    ;;
  "Notification Toggle")
    exec $script/notif_toggle.sh
    ;;
  "Audio Mute Toggle")
    exec $script/volume.sh mute
    ;;
  "Mic Mute Toggle")
    exec pactl set-source-mute @DEFAULT_SOURCE@ toggle
    ;;
  "Output Toggle")
    exec $script/output_toggle.sh
    ;;
  "Power Menu")
    exec $script/dmenu/powermenu.sh
    ;;
esac
