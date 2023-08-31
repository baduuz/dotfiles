#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
    echo $(LC_ALL=de_DE.UTF-8 date "+%a., %d. %b")
elif [ "$BLOCK_BUTTON" = "1" ];then
    $TERMINAL -t Calendar -e calcurse &
fi
