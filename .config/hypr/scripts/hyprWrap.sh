#!/bin/bash

# this script makes hyprland workspaces wrap around from 1-9 may or may-not be useful

ACTIVEWORKSPACE=$(hyprctl monitors | grep "active" | awk '{ print $3 }')

if [ $1 = "+1" ]; then
    if [ $ACTIVEWORKSPACE = "9" ]; then
        hyprctl dispatch workspace 1
    else
        hyprctl dispatch workspace +1
    fi
elif [ $1 = "-1" ]; then
    if [ $ACTIVEWORKSPACE = "1" ]; then
        hyprctl dispatch workspace 9
    else
        hyprctl dispatch workspace -1
    fi
fi
