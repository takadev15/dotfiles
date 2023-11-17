#!/bin/bash

entries=$(cat ~/.script/dmenu/commandlist)
selected=$(echo -e "$entries" | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.widget)

case $selected in
  "Restart Kanshi")
    exec systemctl --user restart kanshi.service
    ;;
esac
