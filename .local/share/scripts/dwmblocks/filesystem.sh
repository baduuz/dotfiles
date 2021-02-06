#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
    AVAIL=$(df -h | awk "/\/(home)/ {print \$4}" | sed "s/^/📁 /")
    printf "$(echo $AVAIL)B"
elif [ "$BLOCK_BUTTON" = "1" ];then
    thunar &
fi
