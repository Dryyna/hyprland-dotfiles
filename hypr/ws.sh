#!/bin/bash

MODE="$1"
WS="$2"

[ -z "$MODE" ] || [ -z "$WS" ] && exit 1

# Hyprland 0.56+: dispatchers are Lua (hl.dsp.*), not the old "workspace N" form.
if [ "$MODE" = "move" ]; then
    hyprctl dispatch "hl.dsp.window.move({ workspace = ${WS} })"
else
    hyprctl dispatch "hl.dsp.focus({ workspace = ${WS} })"
fi

# wallpapers por workspace
case "$WS" in
  1) IMG="$HOME/Desktop/fondos/fondo1.jpg" ;;
  2) IMG="$HOME/Desktop/fondos/fondo2.jpg" ;;
  3) IMG="$HOME/Desktop/fondos/fondo3.jpg" ;;
  4) IMG="$HOME/Desktop/fondos/fondo4.jpg" ;;
  5) IMG="$HOME/Desktop/fondos/fondo5.jpg" ;;
  6) IMG="$HOME/Desktop/fondos/fondo6.jpg" ;;
  7) IMG="$HOME/Desktop/fondos/fondo7.jpg" ;;
  8) IMG="$HOME/Desktop/fondos/fondo8.jpg" ;;
  9) IMG="$HOME/Desktop/fondos/fondo9.jpg" ;;
  10) IMG="$HOME/Desktop/fondos/fondo10.jpg" ;;
  *) exit 0 ;;
esac

# cambia wallpaper (sin flash)
swww img "$IMG" \
  --transition-type grow \
  --transition-angle 45 \
  --transition-duration 0.7 \
  --transition-fps 60
