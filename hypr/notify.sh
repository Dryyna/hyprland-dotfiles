#!/bin/bash

BAT="BAT0" #to check the correct battery name check on ls /sys/class/power_supply
LOW=20
CRITICAL=10 
last_state=""

while true; do
  capacity=$(\cat /sys/class/power_supply/$BAT/capacity)
  stat="$(\cat /sys/class/power_supply/$BAT/status)"

  if [ "$stat" == "Discharging" ]; then
    if [[ $capacity -le $CRITICAL && "$last_state" != "critical_discharging" ]]; then
      notify-send -u critical -i battery-caution "Too low battery, charge now!" "Level: ${capacity}%"
      last_state="critical_discharging"
    elif [[ $capacity -le $LOW && "$last_state" != "low_discharging" ]]; then
      notify-send -u critical -i battery-low "Low Battery" "Level: ${capacity}%"
      last_state="low_discharging"
    elif [ $capacity -gt $LOW ]; then
      last_state=""
    fi
  elif [ "$stat" == "Charging" ]; then
    if [[ $capacity -le $CRITICAL && "$last_state" != "critical_charging" ]]; then
      notify-send -u critical -i battery-caution-charging "⚡ Connected (critical)" "Charging battery $capacity%"
      last_state="critical_charging"
    elif [[ $capacity -le $LOW && "$last_state" != "low_charging" ]]; then
      notify-send -u normal -i battery-low-charging "⚡Connected" "Charging battery: $capacity%"
      last_state="low_charging"
    elif [[ $capacity -eq 100 && "$last_state" != "full" ]]; then
      notify-send -u critical -i battery-full "🔋 DONE" "Battery fully charged: $capacity%"
      last_state="full"
    fi
  fi

  sleep 30 #this while will check battery level per minute
done


