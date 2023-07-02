#!/bin/sh
count="$(checkupdates | wc -l)"
zero=0

if [ "$count" -gt "$zero" ]; then
  notify-send -i box " 📦 Package Updates Available" "$count packages can be updated" && \
  jo text="$count 📦" tooltip="$count packages can be updated"
else
  echo ''
fi
