#!/bin/sh

# Start Xvfb and set display
Xvfb -ac :99 -screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} &
export DISPLAY=:99

exec "$@"
