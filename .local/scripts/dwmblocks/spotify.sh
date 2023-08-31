#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
    if [ $(playerctl -sl | grep "spotify$" | wc -l) = 1 ];then
        STATUS=$(playerctl -sp spotify status)
        if [ "$STATUS" = "Paused" ];then
            DATA=$(echo "[$(playerctl -sp spotify metadata -f '{{title}} - {{artist}}' | cut -c 1-30)]")
        else
            DATA=$(playerctl -sp spotify metadata -f '{{title}} - {{artist}}' | cut -c 1-30)
        fi
        [ "$DATA" != "" ] && echo $DATA > /tmp/polybar-spotify
        if [ -f /tmp/polybar-spotify ];then
                printf "$(cat /tmp/polybar-spotify)"
        fi
    elif [ $(playerctl -sl | grep "spotifyd$" | wc -l) = 1 ];then
        STATUS=$(playerctl -sp spotifyd status)
        if [ "$STATUS" = "Paused" ];then
            DATA=$(echo "[$(playerctl -sp spotifyd metadata -f '{{title}} - {{artist}}' | cut -c 1-30)]")
        else
            DATA=$(playerctl -sp spotifyd metadata -f '{{title}} - {{artist}}' | cut -c 1-30)
        fi
        [ "$DATA" != "" ] && echo $DATA > /tmp/polybar-spotify
        if [ -f /tmp/polybar-spotify ];then
                echo "$(cat /tmp/polybar-spotify)"
        fi
    else
        printf "Currently not playing"
    fi
elif [ "$BLOCK_BUTTON" = "1" ];then
    if [ $(playerctl -sl | grep "spotify$" | wc -l) = 1 ];then
        playerctl -sp spotify play-pause
    elif [ $(playerctl -sl | grep "spotifyd$" | wc -l) = 1 ];then
        playerctl -sp spotifyd play-pause
    fi
elif [ "$BLOCK_BUTTON" = "3" ];then
    if [ $(playerctl -sl | grep "spotify$" | wc -l) = 1 ];then
        playerctl -sp spotify next
    elif [ $(playerctl -sl | grep "spotifyd$" | wc -l) = 1 ];then
        playerctl -sp spotifyd next
    fi
else
    if [ $(playerctl -sl | grep "spotify$" | wc -l) = 1 ];then
        spotify &
    elif [ $(playerctl -sl | grep "spotifyd$" | wc -l) = 1 ];then
        alacritty -e spt &
    fi
fi
