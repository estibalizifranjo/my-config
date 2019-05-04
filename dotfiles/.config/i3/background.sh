#!/bin/sh

WALLPAPER="${HOME}/Pictures/Wallpapers/$(hostname).png"

if [ -f "${WALLPAPER}" ]; then
    if [ "${SWAYSOCK}" ]; then
        swaymsg -t command output '*' bg "${WALLPAPER}" fill
    else
        feh --bg-fill --no-fehbg --no-xinerama "${WALLPAPER}"
    fi
fi
