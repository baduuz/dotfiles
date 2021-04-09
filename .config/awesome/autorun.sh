#!/bin/dash

run() {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run picom
run setxkbmap us -option caps:swapescape
