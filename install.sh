#!/usr/bin/env bash

set -e

echo "==> Initializing configuration deployment..."

CONFIG_FOLDERS=(hypr waybar rofi kitty fastfetch fish themes)
BACKUP_DIR="$HOME/.config/backup_$(date +%Y%m%d_%H%M%S)"

# Backup existing configurations
for folder in "${CONFIG_FOLDERS[@]}"; do
    if [ -d "$HOME/.config/$folder" ]; then
        mkdir -p "$BACKUP_DIR"
        echo "    [BACKUP] Moving ~/.config/$folder to $BACKUP_DIR/"
        mv "$HOME/.config/$folder" "$BACKUP_DIR/"
    fi
done

# Deploy new configurations
echo "==> Deploying configuration files to ~/.config/..."
cp -r .config/* "$HOME/.config/"

# Apply permissions
echo "==> Setting executable permissions on scripts..."
chmod +x "$HOME/.config/rofi/scripts/"*.sh 2>/dev/null || true
chmod +x "$HOME/.config/waybar/"*.py 2>/dev/null || true

echo "==> Deployment completed successfully. Please reload your WM."
