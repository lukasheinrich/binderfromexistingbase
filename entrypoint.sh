#!/bin/sh
echo "setting up ATLAS and running: [$@]"
. /home/atlas/setup.sh
which jupyter
eval "$@"
