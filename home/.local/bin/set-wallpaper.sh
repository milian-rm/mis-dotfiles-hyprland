#!/bin/bash
CACHE_FILE="$HOME/.cache/current-wallpaper"
if [ -f "$CACHE_FILE" ]; then
    WALLPAPER=$(cat "$CACHE_FILE")
else
    WALLPAPER=$(find "$HOME/wallpapers" -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" \) | shuf -n 1)
    echo "$WALLPAPER" > "$CACHE_FILE"
fi
sleep 1
awww img "$WALLPAPER"
sed -i "s|^[[:space:]]*path[[:space:]]*=.*|    path = $WALLPAPER|" "$HOME/.config/hypr/hyprlock.conf"
