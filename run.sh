#!/bin/sh

# Start Xvfb
Xvfb -ac :99 -screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} &
export DISPLAY=:99

git clone "$1" repo
cd repo
robot "$2"
