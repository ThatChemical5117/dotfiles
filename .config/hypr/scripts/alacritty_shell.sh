#!/bin/bash
# Requires Alacritty to be installed
# Runs a sub-instance of Alacritty if one exists
# This is to save on memory as Alacritty can share one process instead of spawning a new one each time

# See hyprland.conf for an example

INSTANCE=$(hyprctl clients | grep "class: Alacritty" | head -1 )


if [ -z "$INSTANCE" ]
then
    if [ -z "$1" ]
    then
        alacritty &
    else
        alacritty -e "$1" &
    fi
else
    if [ -z "$1" ]
    then

        alacritty msg create-window &
    else
        alacritty msg create-window -e "$1" &
    fi
fi
