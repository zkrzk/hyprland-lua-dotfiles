# Hyprland Modular Configuration (Lua-Driven)

A modular, file-structured Hyprland configuration managed via Lua script architecture. This repository provides dynamic theme compilation, automated wallpaper architecture, and multi-layout Waybar configuration management.

## Repository Architecture

```text
.config/
├── hypr/
│   ├── hyprland.lua          # Main compositor initialization entrypoint
│   ├── hypridle.conf         # Idle management daemon properties
│   ├── hyprlock.conf         # Screen locker configuration
│   ├── current_colors.lua    # Dynamically generated theme variables
│   ├── wallpaper-change.sh   # Background processing and wallpaper daemon tool
│   └── modules/
│       ├── binds.lua         # Keyboard shortcuts and input mappings
│       ├── decorations.lua   # Window rules, blurs, shadows, and animations
│       └── autostart.lua     # Core background processes and system daemons
├── waybar/                   # Waybar bar configurations (5 switchable layouts via Rofi)
├── rofi/                     # Application launcher and layout switcher profiles
├── kitty/                    # Terminal emulator profile
└── themes/                   # Flat-file system color database

System Dependencies
Before deployment, ensure the core ecosystem and helper utilities are fully installed on your rolling release distribution:

Compositor & Core Utilities
hyprland (Modern Lua-supported versions)

hypridle & hyprlock (Official idle/lock management ecosystem)

kitty (Default target terminal emulator)

Interface & Themes
waybar (Status bar configuration)

rofi-wayland (Dynamic menu and application infrastructure)

waypaper / swww (Required wallpaper backend execution)

Scripting & Custom Daemons
python3 (Required for specialized scripting backends)

lua (Required for standard file-structure compilation)

Installation and Deployment
Clone the assets and run the deployment script directly from your terminal interface:

Bash
git clone [https://github.com/zkrzk/hyprland-lua-dotfiles.git](https://github.com/zkrzk/hyprland-lua-dotfiles.git)
cd hyprland-lua-dotfiles
chmod +x install.sh
./install.sh
Warning: The installation script backs up existing structures inside ~/.config/ with the .bak extension before writing directories.

Core Component Configuration
1. Dynamic Wallpaper & Themes
The background framework uses wallpaper-change.sh. It handles color abstraction pipelines, matching system-wide theme properties with target wallpaper palettes, and links files via:
~/.config/hypr/current_wallpaper

2. Waybar Layout Switcher
Managed dynamically via Rofi. Configurations can be updated or added directly in ~/.config/waybar/. The 5 standard switchable profiles are stored sequentially in the asset folder.

3. Localization and Prayer Times Setup
Custom user utilities (such as python scripts tracking geolocation or local schedules) execute as background processes called during initialization in:
~/.config/hypr/modules/autostart.lua

Modify geographical variables directly inside your local script configs to calculate correct regional target times.

