#!/bin/bash

entries="Active\nScreen\nOutput\nArea Save\nWindow\nArea Clipboard"
 
selected=$(echo -e "$entries" | rofi -dmenu)

area_clipboard() {
  slurp_output=$(slurp)
  if [ -n "$slurp_output" ]; then
    grim -g "$slurp_output" - | wl-copy --type image/png
    notify-send "Screenshot" "Screenshot saved at clipboard"
    canberra-gtk-play -i screen-capture -d "screenShot"
  fi
}

area_save() {
  slurp_output=$(slurp)
  if [ -n "$slurp_output" ]; then
    IMG=~/Pictures/$(date +%Y-%m-%d_%H-%M-%S).png
    if grim -g "$slurp_output" "$IMG" && wl-copy < "$IMG"; then
      notify-send "Screenshot" "Screenshot saved at file: $IMG"
      canberra-gtk-play -i screen-capture -d "screenShot"
    fi
  fi
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
    area_save
    ;;
  "Area Clipboard")
    area_clipboard
    ;;
  "Window")
    /usr/share/sway/scripts/grimshot --notify save window
    canberra-gtk-play -i screen-capture -d "screenShot"
    ;;
esac
