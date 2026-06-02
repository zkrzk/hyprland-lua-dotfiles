#!/usr/bin/env bash

LAYOUTS_DIR="$HOME/.config/waybar/layouts"
CHOSEN=$(ls "$LAYOUTS_DIR" | rofi -dmenu -i -p "󰃚 Select Waybar Layout:")

if [ -n "$CHOSEN" ]; then
    rm -f "$HOME/.config/waybar/config.jsonc" "$HOME/.config/waybar/style.css"
    
    ln -s "$LAYOUTS_DIR/$CHOSEN/config.jsonc" "$HOME/.config/waybar/config.jsonc"
    ln -s "$LAYOUTS_DIR/$CHOSEN/style.css" "$HOME/.config/waybar/style.css"
    
    killall waybar
    waybar &
fi
