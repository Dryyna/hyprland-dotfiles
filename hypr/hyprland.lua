-- Migrated from hyprland.conf (reviewed to match conf behavior)
-- https://wiki.hypr.land/Configuring/Start/

---@module 'hl'

--###############
--## MONITOR ###
--###############

hl.monitor({
    output   = "eDP-1",
    mode     = "preferred",
    position = "auto",
    scale    = 1,
})

--###############
--## PROGRAMAS ###
--###############

local mainMod     = "SUPER"
local terminal    = "kitty"
local menu        = "rofi -show drun"
local fileManager = "dolphin"

--###############
--## WINDRULE ###
--###############

hl.window_rule({
    name  = "librewolf",
    match = {
        class = "^(librewolf)$",
    },
    opacity = 1,
})

hl.window_rule({
    name  = "floorp",
    match = {
        class = "^(floorp)$",
    },
    opacity = 1,
})

hl.window_rule({
    name  = "vmware",
    match = {
        class = "^(Vmware)$",
    },
    opacity = 1,
})

hl.window_rule({
    name  = "tor-browser",
    match = {
        class = "^(Tor Browser)$",
    },
    opacity = 0.8,
})

hl.window_rule({
    name  = "mullvad-browser",
    match = {
        class = "^(Mullvad Browser)$",
    },
    opacity = 0.8,
})

hl.window_rule({
    name  = "autio-controller",
    match = {
        class = "^(org.pulseaudio.pavucontrol)$",
    },
    opacity = 0.8,
    center = true,
    float = true,
})

hl.window_rule({
    name  = "vscode",
    match = {
        class = "^(code)$",
    },
    opacity = 0.8,
})

hl.window_rule({
    name  = "libreoffice-menu",
    match = {
        class = "^(libreoffice-startcenter)$",
    },
    opacity = 0.75,
})

hl.window_rule({
    name  = "libreoffice-cal",
    match = {
        class = "^(libreoffice-calc)$",
    },
    opacity = 0.75,
})

hl.window_rule({
    name  = "libreoffice-writter",
    match = {
        class = "(libreoffice-writer)$",
    },
    opacity = 0.75,
})

hl.window_rule({
    name  = "BlueTooth Manager",
    match = {
        class = "^(blueman-manager)$",
    },
    opacity = 0.85,
    float = true,
    center = true,
})

hl.window_rule({
    name  = "dolphin_float",
    match = {
        class = "^(org.kde.dolphin)$",
    },
    float = true,
    opacity = 1,
})

hl.window_rule({
    name  = "obsidian",
    match = {
        class = "^(obsidian)$",
    },
    opacity = 0.8,
})

hl.window_rule({
    name  = "emoji_float",
    match = {
        class = "^(org.kde.plasma.emojier)$",
    },
    float = true,
    opacity = 0.95,
    size = { 600, 500 },
    center = true,
})

hl.window_rule({
    name  = "bitwarden",
    match = {
        class = "^(Bitwarden)$",
    },
    opacity = 0.85,
})

hl.window_rule({
    name  = "wireshark",
    match = {
        class = "^(org.wireshark.Wireshark)$",
    },
    opacity = 0.85,
})

hl.window_rule({
    name  = "Burpsuit",
    match = {
        class = "^(install4j-burp-StartBurp)$",
    },
    opacity = 0.85,
})

--############################
--## VARIABLES DE ENTORNO ###
--############################

hl.env("XCURSOR_SIZE", 24)
hl.env("HYPRCURSOR_SIZE", 24)
hl.env("HYPRLAND_NO_DEFAULT_WALLPAPER", 1)
-- conf tenía env duplicado en una sola línea; valor correcto: kde
hl.env("QT_QPA_PLATFORMTHEME", "kde")

--###############
--## GENERAL ###
--###############

hl.config({
    general = {
        gaps_in = 4,
        gaps_out = 3,
        border_size = 2,
        layout = "dwindle",
        col = {
            active_border = "rgba(33ccffee)",
            inactive_border = "rgba(595959aa)",
        },
    },
})

--###############
--## DECORACIÓN ###
--###############

hl.config({
    decoration = {
        rounding = 6,
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = "rgba(000000aa)",
        },
        blur = {
            enabled = true,
            size = 1,
            passes = 1,
            ignore_opacity = false,
        },
    },
})

--##################
--## ANIMACIONES ###
--##################
-- conf: bezier = smooth, 0.25, 0.1, 0.25, 1.0
--       animation = workspaces, 1, 7, smooth, slidevert

hl.config({
    animations = {
        enabled = true,
    },
})

hl.curve("smooth", {
    type = "bezier",
    points = { { 0.25, 0.1 }, { 0.25, 1.0 } },
})

hl.animation({
    leaf = "workspaces",
    enabled = true,
    speed = 7,
    bezier = "smooth",
    style = "slidevert",
})

--###############
--## DWINDLE ###
--###############

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

--###############
--## INPUT ###
--###############

hl.config({
    input = {
        kb_layout = "latam",
        follow_mouse = 0,
        sensitivity = 0,
    },
})

--###############
--## MISC ###
--###############

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
    },
})

--##################
--## KEYBINDINGS ###
--##################

-- Apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + X", hl.dsp.window.close())
hl.bind(mainMod .. " + ALT + SHIFT + P", hl.dsp.exit())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + SHIFT + X", hl.dsp.exec_cmd("hyprlock"))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.exec_cmd("floorp"))
hl.bind(mainMod .. " + SHIFT + W", hl.dsp.exec_cmd("flatpak run io.gitlab.librewolf-community"))
hl.bind(mainMod .. " + SHIFT + B", hl.dsp.exec_cmd("brave"))
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("plasma-emojier"))

-- Screenshots
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/screenshots"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/screenshots"))

-- Recordings
hl.bind(mainMod .. " + r", hl.dsp.exec_cmd("~/.config/hypr/record.sh screen_only"))
hl.bind(mainMod .. " + SHIFT + r", hl.dsp.exec_cmd("~/.config/hypr/record.sh microphone_only"))
hl.bind(mainMod .. " + ALT + SHIFT + r", hl.dsp.exec_cmd("~/.config/hypr/record.sh audio_only"))

-- Bindoj (focus)
hl.bind(mainMod .. " + Left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + Up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + Down", hl.dsp.focus({ direction = "down" }))
hl.bind(mainMod .. " + period", hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("togglesplit"))

-- Scratchpad
hl.bind(mainMod .. " + E", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + E", hl.dsp.window.move({ workspace = "special:magic" }))

-- Move Bindoj
hl.bind(mainMod .. " + SHIFT + Left", hl.dsp.window.swap({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.window.swap({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + Up", hl.dsp.window.swap({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + Down", hl.dsp.window.swap({ direction = "down" }))

-- Resize Bindoj (resizeactive en conf)
hl.bind(mainMod .. " + ALT + Left", hl.dsp.window.resize({ x = -100, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + Right", hl.dsp.window.resize({ x = 100, y = 0, relative = true }))
hl.bind(mainMod .. " + ALT + Up", hl.dsp.window.resize({ x = 0, y = -100, relative = true }))
hl.bind(mainMod .. " + ALT + Down", hl.dsp.window.resize({ x = 0, y = 100, relative = true }))

-- Workspaces
hl.bind(mainMod .. " + code:10", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 1"))
hl.bind(mainMod .. " + code:11", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 2"))
hl.bind(mainMod .. " + code:12", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 3"))
hl.bind(mainMod .. " + code:13", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 4"))
hl.bind(mainMod .. " + code:14", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 5"))
hl.bind(mainMod .. " + code:15", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 6"))
hl.bind(mainMod .. " + code:16", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 7"))
hl.bind(mainMod .. " + code:17", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 8"))
hl.bind(mainMod .. " + code:18", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 9"))
hl.bind(mainMod .. " + code:19", hl.dsp.exec_cmd("~/.config/hypr/ws.sh go 10"))

hl.bind(mainMod .. " + SHIFT + code:10", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 1"))
hl.bind(mainMod .. " + SHIFT + code:11", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 2"))
hl.bind(mainMod .. " + SHIFT + code:12", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 3"))
hl.bind(mainMod .. " + SHIFT + code:13", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 4"))
hl.bind(mainMod .. " + SHIFT + code:14", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 5"))
hl.bind(mainMod .. " + SHIFT + code:15", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 6"))
hl.bind(mainMod .. " + SHIFT + code:16", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 7"))
hl.bind(mainMod .. " + SHIFT + code:17", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 8"))
hl.bind(mainMod .. " + SHIFT + code:18", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 9"))
hl.bind(mainMod .. " + SHIFT + code:19", hl.dsp.exec_cmd("~/.config/hypr/ws.sh move 10"))

-- Workspace scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Mouse (bindm)
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Audio (bindel → locked + repeating)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { locked = true, repeating = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true, repeating = true })

-- Brightness (bindel → locked + repeating)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s 10%+"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 10%-"), { locked = true, repeating = true })

-- Media (bindl → locked only)
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })

--###############
--## AUTOSTART ###
--###############
-- Equivalente a exec-once del conf (solo en hyprland.start, no al recargar)

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar && pkillwaybar && waybar")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("swww-daemon")
    hl.exec_cmd("nm-applet --indicator")
    -- Mantiene el clipboard vivo aunque se cierre la app de la que copiaste
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("~/.config/hypr/ws.sh go 1")
    hl.exec_cmd("~/.config/hypr/batteryN.sh")
    hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user start xdg-desktop-portal-hyprland")
    hl.exec_cmd("/usr/lib/xdg-desktop-portal")
end)
