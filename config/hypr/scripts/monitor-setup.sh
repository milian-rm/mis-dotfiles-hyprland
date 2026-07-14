#!/bin/bash
EXTERNAL="HDMI-A-1"
LAPTOP="eDP-1"

killall waybar
sleep 0.5

if hyprctl monitors | grep -q "$EXTERNAL"; then
    ln -sf ~/.config/hypr/hyprland-dual.conf ~/.config/hypr/hyprland.conf
    hyprctl reload
    sleep 1
    waybar -c ~/.config/waybar/config-hdmi &
    waybar -c ~/.config/waybar/config-laptop &
else
    ln -sf ~/.config/hypr/hyprland-solo.conf ~/.config/hypr/hyprland.conf
    hyprctl reload
    sleep 1
    waybar -c ~/.config/waybar/config-solo &
fi
