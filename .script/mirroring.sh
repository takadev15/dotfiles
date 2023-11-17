#!/bin/bash

detect () {
  if pgrep -x "wl-mirror" > /dev/null; then
    jo text=󰍺 tooltip="Left-click to stop mirroring"
  fi
}

case "$1" in
  "detect")
    detect
    ;;
esac
