#!/bin/sh

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom --experimental-backends
run setxkbmap us -option caps:swapescape
run xmodmap ~/.Xmodmap
run udiskie --tray
run nextcloud --background
run polychromatic-tray-applet
