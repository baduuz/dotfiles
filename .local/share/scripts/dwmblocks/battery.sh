#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
    for battery in /sys/class/power_supply/BAT*
    do
        MODE=$(cat $battery/status)
        CAPACITY=$(cat "$battery/capacity")

        SYMBOL=""

        if [ "$MODE" = "Charging" ]; then
            SYMBOL=""
        elif [ "$MODE" = "Discharging" ]; then
            if [ $(($CAPACITY < 20)) = 1 ];then
                SYMBOL=""
            elif [ $(($CAPACITY < 50)) = 1 ];then
                SYMBOL=""
            elif [ $(($CAPACITY < 70)) = 1 ];then
                SYMBOL=""
            else
                SYMBOL=""
            fi
        else
            SYMBOL=""
        fi

        printf "$SYMBOL $CAPACITY%%"
    done
    printf ""
fi
