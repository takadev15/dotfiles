#!/bin/bash

if pgrep -x "wf-recorder" > /dev/null; then
  jo text=● tooltip="Left-click to stop recording"
fi
