#!/bin/bash

STATUS=$(dunstctl is-paused)

if [[ "$STATUS" = "false" ]]; then
  dunstctl set-paused true
  gsettings set org.gnome.desktop.sound event-sounds false
elif [[ "$STATUS" = "true" ]]; then
  dunstctl set-paused false
  gsettings set org.gnome.desktop.sound event-sounds true
fi
