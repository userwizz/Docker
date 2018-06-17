#!/bin/sh

# Start Xvfb
Xvfb -ac :99 -screen 0 ${SCREEN_WIDTH}x${SCREEN_HEIGHT}x${SCREEN_COLOUR_DEPTH} &
export DISPLAY=:99

# clone repo
git clone "$1" repo

# run tests
cd repo
if [ -z "$3" ]; then
    robot "$2"
else
	robot "$2" "$3"
fi
