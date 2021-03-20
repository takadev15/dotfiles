#!/bin/bash

set -e
file="/sys/class/backlight/amdgpu_bl0/brightness"
current=$(cat "$file")
new="$current"

if [ "$1" = "-inc" ]
then
	new=$(( current + $2 ))
fi

if [ "$1" = "-dec" ]
then
new=$(( current - $2 ))
fi

echo "$new" | tee "$file"
