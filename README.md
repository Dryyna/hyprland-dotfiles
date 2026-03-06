# arch_linux_dotfiles
## Stack && Dependencies
- WM: Hyprland
- Wallpaper: swww
- Lock: Hyprlock
- Screenshots: Hyprshot
- Bar: Waybar
- Launch: Wofi
- Notifications: SwayNC
- Fonts: Nerd Font
- Themes: Papirus
- Shell: zsh + PowerLevel 10 k
- Terminal: Kitty
- Fetch: Fastfetch
## NVChat config (personal)
- For no autocomplete:
in ~/.confg/nvim/lua/plugins/init.lua add init.lua
- For transparecy:
in ~/.config/nvim/init.lua add neovim_transparent.txt
## Credits
- Waybar config: https://github.com/HANCORE-linux/waybar-themes
## Important Notes
### Zsh
- Instant Prompt is disabled to avoid conflicts with fastfetch.
- The `.zshrc` is configured so that **fastfetch** runs before the shell prompt initializes.
- This setup is specifically tuned to work with Powerlevel10k.- The Powerlevel10k initialization line in `.zshrc` is intentionally placed after fastfetch to ensure proper loading order.
- The default P10k instant prompt snippet is commented out to prevent startup warnings or rendering issues.
- The `.zshrc` is configured to send ponysay errors to /dev/null
### Fastfetch
- Fastfetch is configured with custom styling and personal aesthetic preferences.
- Image rendering is enabled using kitty image protocol.
- Custom logo images are stored inside the fastfetch profile directory.
- The configuration prioritizes visual layout and separator formatting.
## Cool terminal apps:
- Ponysay
- Cowsay
- Btop
- Cava
- Cmatrix
- Lolcat
- Pipesh
- Nyancat
- Oneko
- Peaclock
- aalib
- asciiquarium
- sl
- mapscii
