#!/bin/bash

pgrep waybar

if [ $? -eq 0 ]; then
  pkill waybar && waybar &
else
  waybar & && pkill waybar && waybar &
fi

