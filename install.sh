#!/usr/bin/env bash

echo "✨ Setting up your legendary Hyprland-Lua Rice..."

# Create backup of existing configs if they exist
for folder in hypr waybar rofi kitty fastfetch fish themes; do
    if [ -d "$HOME/.config/$folder" ]; then
        echo "📦 Backing up old $folder config to $folder.bak"
        mv "$HOME/.config/$folder" "$HOME/.config/${folder}.bak"
    fi
done

# Copy new configs
echo "🚀 Copying new configs to ~/.config/..."
cp -r .config/* "$HOME/.config/"

# Make scripts executable
echo "🔑 Making scripts executable..."
chmod +x "$HOME/.config/rofi/scripts/"*.sh
chmod +x "$HOME/.config/waybar/"*.py

echo "✅ All done! Reload Hyprland and enjoy the magic!"
