#!/bin/bash
ln -sf "$1" /home/zkr/.config/hypr/current_wallpaper
wal -i "$1" -n
pywalfox update
