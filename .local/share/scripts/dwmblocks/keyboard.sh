#!/bin/sh

if [ "$BLOCK_BUTTON" = "" ];then
	QUERY=$(setxkbmap -query)
	LANG=$(echo "$QUERY" | awk '/layout/ {print $2}')
	CAPS=$([ $(setxkbmap -query | grep caps:swapescape | wc -l) = 0 ] && echo " ")
	printf "$LANG$CAPS"
elif [ "$BLOCK_BUTTON" = "1" ];then
    LANG=$(setxkbmap -query | awk '/layout/ {print $2}')
    if [ "$LANG" = "de" ];then
    	setxkbmap us
    else
    	setxkbmap de
    fi
elif [ "$BLOCK_BUTTON" = "3" ];then
    CAPS=$(setxkbmap -query | grep caps:swapescape | wc -l)
    if [ "$CAPS" = 1 ];then
        setxkbmap -option ""
    else
        setxkbmap -option caps:swapescape
    fi
fi
