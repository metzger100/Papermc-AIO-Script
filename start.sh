#!/bin/bash

BINDIR=$(dirname "$(readlink -fn "$0")")
cd "$BINDIR"

rm screenlog.0
screen -L -S "minecraft" bash -c "sh ./loop.sh"
