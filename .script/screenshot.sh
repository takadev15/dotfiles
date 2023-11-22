#!/bin/bash

entries="Active\nScreen\nOutput\nArea Save\nWindow\nArea Clipboard"
 
selected=$(echo -e "$entries" | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.widget)

area_clipboard () {
  grim -g "$(slurp)" - | wl-copy --type image/png
  notify-send.sh "Screenshot" "Screenshot saved at clipboard"
  canberra-gtk-play -i screen-capture -d "screenShot"
}

case $selected in
  "Active")
    /usr/share/sway/scripts/grimshot --notify save active
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
  "Screen")
    /usr/share/sway/scripts/grimshot --notify save screen
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
  "Output")
    /usr/share/sway/scripts/grimshot --notify save output
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
  "Area Save")
    /usr/share/sway/scripts/grimshot --notify save area
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
  "Area Clipboard")
    area_clipboard
    # /usr/share/sway/scripts/grimshot --notify copy area
    # canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
  "Window")
    /usr/share/sway/scripts/grimshot --notify save window
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
esac
