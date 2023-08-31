#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
    VOLUME=$(pamixer --get-volume)
    MUTE=$(pamixer --get-mute)

    if [ "$MUTE" = "true" ];then
        printf "婢 $VOLUME%%"
    elif [ $(($VOLUME > 100)) = 1 ];then
        printf " $VOLUME%%"
    elif [ $(($VOLUME > 80)) = 1 ];then
        printf "墳 $VOLUME%%"
    elif [ $(($VOLUME > 40)) = 1 ];then
        printf "奔 $VOLUME%%"
    else
        printf "奄 $VOLUME%%"
    fi
elif [ "$BLOCK_BUTTON" = "1" ];then
    pavolume toggle &
elif [ "$BLOCK_BUTTON" = "3" ];then
    $TERMINAL -t "Volume Control" -e ncpamixer&
fi
