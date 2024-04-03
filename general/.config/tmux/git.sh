#!/bin/sh

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
NO_UNCOMMITED="$(git status --porcelain | wc -l)"
if [ "$NO_UNCOMMITED" = "0" ];then
UNCOMMITED=""
else
UNCOMMITED=" ($NO_UNCOMMITED)"
fi
echo "$BRANCH$UNCOMMITED"
