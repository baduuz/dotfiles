#!/bin/bash

if [ "$BLOCK_BUTTON" = "" ];then
    printf "$(paru -Qu | wc -l)"
elif [ "$BLOCK_BUTTON" = "1" ];then
    notify-send "Upgradable Packages" "$(paru -Qu)"
fi
