#!/bin/bash

entries=$(cat ~/.script/dmenu/powermenu)
selected=$(echo -e "$entries" | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.widget)

case $selected in
  "Reboot")
    exec systemctl reboot
    ;;
  "Suspend")
    exec systemctl suspend
    ;;
  "Power Off")
    exec systemctl poweroff
    ;;
esac
