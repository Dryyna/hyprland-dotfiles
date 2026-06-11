#!/bin/bash

# -------------- colors (Pango markup for Waybar tooltip) ---------------
cyanColour="<span foreground=\"#00ffff\">"
yellowColour="<span foreground=\"#ffff00\">"
greenColour="<span foreground=\"#00ff00\">"
endColour="</span>"
# ---------------------------------------------------------------------

CPU=$(top -bn1 | awk '/Cpu/ {print int(100 - $8)}')
MEM=$(free | awk '/Mem/ {printf "%.0f", $3/$2 * 100}')

# GPU - Intel i915 (no NVIDIA)
# Try gpu_busy_percent first (exposed on some i915 setups)
GPU=$(cat /sys/class/drm/card0/device/gpu_busy_percent 2>/dev/null)
[ -z "$GPU" ] && GPU=$(cat /sys/class/drm/card1/device/gpu_busy_percent 2>/dev/null)

if [ -z "$GPU" ]; then
  # Fallback: rough % load from current freq vs min/max (common on i915 when busy_percent not available)
  card=""
  if [ -d /sys/class/drm/card0/gt/gt0 ]; then card=card0; fi
  if [ -z "$card" ] && [ -d /sys/class/drm/card1/gt/gt0 ]; then card=card1; fi
  if [ -n "$card" ]; then
    min=$(cat /sys/class/drm/$card/gt/gt0/rps_min_freq_mhz 2>/dev/null || echo 0)
    cur=$(cat /sys/class/drm/$card/gt/gt0/rps_cur_freq_mhz 2>/dev/null || echo 0)
    max=$(cat /sys/class/drm/$card/gt/gt0/rps_max_freq_mhz 2>/dev/null || echo 0)
    if [ "$max" -gt "$min" ] 2>/dev/null; then
      GPU=$(( (cur - min) * 100 / (max - min) ))
    else
      GPU=0
    fi
  fi
fi

[ -z "$GPU" ] && GPU="N/A"
GPU=$(echo "$GPU" | tr -d ' \n')

if [ "$GPU" = "N/A" ]; then
  GPU_STR="N/A"
else
  GPU_STR="${GPU}%"
fi

echo -e "${cyanColour}CPU: ${CPU}%${endColour} | ${yellowColour}MEM: ${MEM}%${endColour} | ${greenColour}GPU: ${GPU_STR}${endColour}"
