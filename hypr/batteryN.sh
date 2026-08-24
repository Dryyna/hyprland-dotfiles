#!/bin/bash
#
# Battery notifier - Hyprland + swaync
# Mejora: notificaciones bonitas + evita spam de "low" + "too low"
#
# Para probar manualmente:
#   pkill -f batteryN.sh && ~/.config/hypr/batteryN.sh &
#

BAT="BAT0"                    # cambia a BAT1 si tu batería se llama diferente (ls /sys/class/power_supply)
LOW=20
CRITICAL=10
RECOVERY=30                   # al subir de este % se resetean las alertas (permite avisar de nuevo después)

low_notified=false
critical_notified=false

while true; do
  capacity=$(cat /sys/class/power_supply/$BAT/capacity 2>/dev/null || echo 0)
  stat=$(cat /sys/class/power_supply/$BAT/status 2>/dev/null || echo Unknown)

  if [ "$stat" = "Discharging" ]; then
    # === CRÍTICO primero (evita que salga también el de "low") ===
    if [ "$capacity" -le "$CRITICAL" ] && ! $critical_notified; then
      notify-send -u critical -i battery-caution \
        "🔋 Batería muy baja" "¡Solo ${capacity}%! Conecta el cargador ya."
      critical_notified=true
      low_notified=true          # marcamos low también para no spawnear el otro después

    elif [ "$capacity" -le "$LOW" ] && ! $low_notified; then
      notify-send -u normal -i battery-low \
        "🔋 Batería baja" "Quedan ${capacity}%"
      low_notified=true
    fi

    # Resetear avisos si la batería se recuperó bastante (ej: estabas en 8% y sube a 32%)
    if [ "$capacity" -gt "$RECOVERY" ]; then
      low_notified=false
      critical_notified=false
    fi

  else
    # Cualquier otro estado (Charging, Full, etc.) → reseteamos todo
    # Así la próxima vez que se desconecte el cargador, vuelve a avisar limpio.
    low_notified=false
    critical_notified=false

    # Notificación bonita cuando llega al 100%
    if [ "$stat" = "Charging" ] && [ "$capacity" -eq 100 ]; then
      notify-send -u normal -i battery-full \
        "🔋 Carga completa" "Batería al 100%. Puedes desconectar."
    fi
  fi

  sleep 30
done


