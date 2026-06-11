#!/bin/bash

choice=$(printf "󰂅  Performance\n󰂀  Balanced\n󱈏  Power Saver" | \
    rofi -dmenu -p "Power Mode" \
    -theme-str '
        * {
          font: "JetBrainsMono Nerd Font 18";
        }
        element-text {
          horizontal-align: 0;
        }
        listview {
          lines: 3;
          width: 100%;
        }
        window {
          width: 600px;
        }
        element {
          padding: 6px 12px;
        }
    ')

case "$choice" in
    *Performance*)
        powerprofilesctl set performance
        notify-send -t 2000 "Power Profile" "Set to Performance"
        ;;
    *Balanced*)
        powerprofilesctl set balanced
        notify-send -t 2000 "Power Profile" "Set to Balanced"
        ;;
    *Power\ Saver*)
        powerprofilesctl set power-saver
        notify-send -t 2000 "Power Profile" "Set to Power Saver"
        ;;
esac
