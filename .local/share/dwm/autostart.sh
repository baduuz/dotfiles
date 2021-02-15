#!/bin/sh

setxkbmap -option caps:swapescape&

sxhkd &

dwmblocks &

/usr/bin/feh --no-fehbg --bg-fill "$HOME/Pictures/Wallpaper/wallpaper"&

picom --experimental-backends&


dunst&

