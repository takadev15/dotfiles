#!/bin/bash

entries=$(cat ~/.script/dmenu/powermenu)
selected=$(echo -e "$entries" | rofi -dmenu)

case $selected in
  "Reboot")
    exec systemctl reboot
    ;;
  "Sleep")
    exec systemctl suspend
    ;;
  "Shutdown")
    exec systemctl poweroff
    ;;
esac
