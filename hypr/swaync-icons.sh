#!/bin/bash
# Uso:
#   pkill swaync
#   ~/.config/hypr/swaync-icons.sh &
#   exec-once = ~/.config/hypr/swaync-icons.sh

# Carpeta temporal aislada solo para los settings de GTK de este proceso
TMP_GTK="/tmp/swaync-gtk-$$"
mkdir -p "$TMP_GTK/gtk-3.0" "$TMP_GTK/gtk-4.0"

# Forzamos Papirus (no -Dark) como tema de iconos para que se vean más coloridos y nítidos en notificaciones
# Esto SOLO afecta a swaync, el resto del sistema sigue con candy-icons
cat > "$TMP_GTK/gtk-3.0/settings.ini" << 'EOF'
[Settings]
gtk-icon-theme-name=Papirus
gtk-application-prefer-dark-theme=true
EOF

cp "$TMP_GTK/gtk-3.0/settings.ini" "$TMP_GTK/gtk-4.0/settings.ini"

# Lanzamos swaync usando la config real del usuario,
# pero con XDG_CONFIG_HOME temporal para que GTK lea los settings de iconos de Papirus.
# Esto NO afecta el resto del escritorio.
XDG_CONFIG_HOME="$TMP_GTK" \
swaync \
  --config "$HOME/.config/swaync/config.json" \
  --style "$HOME/.config/swaync/style.css" \
  "$@"

# Limpieza (el proceso ya terminó si llegamos aquí)
rm -rf "$TMP_GTK"
