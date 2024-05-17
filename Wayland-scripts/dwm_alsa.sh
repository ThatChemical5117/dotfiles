#!/bin/sh

# Modified from a previous dwm script, used to display the audio volume in waybar.
# Detects the current audio output and display that
# Uses a nerd font for icons

STATUS=$(wpctl status | grep "\[vol" | grep "\*  " | awk '{print $NF }' | sed 's/\]//')
VOLID=$(wpctl status | grep "\[vol" | grep "\*  " | awk '{print $3 }' | sed 's/\.//')
VOL=$(wpctl get-volume $VOLID | awk '{ print $2 }' | sed 's/[^0-9]*//g' | sed 's/0*//')

if [ "$STATUS" = "MUTED" ]; then
    printf "󰖁"
else

    if [ -z "$VOL" ]; then
        printf "󰖁"
    elif [ "$VOL" -gt 0 ] && [ "$VOL" -le 33 ]; then
        printf " %s%%" "$VOL"
    elif [ "$VOL" -gt 33 ] && [ "$VOL" -le 66 ]; then
        printf " %s%%" "$VOL"
    else
        printf "󰕾 %s%%" "$VOL"
    fi
fi
