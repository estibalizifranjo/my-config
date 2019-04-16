#!/bin/sh

if [ "${WALLPAPER}" ]; then
    if [ "${SWAYSOCK}" ]; then
        swaymsg -t command output '*' bg "${WALLPAPER}" fill
    else
        feh --no-fehbg --bg-fill "${WALLPAPER}"
    fi
fi
