#!/bin/sh

# For control of audio with wpctl. Detects current active audio output and changes that

VOLID=$(wpctl status | grep "\[vol" | grep "\*  " | awk '{ print $3 }' | sed 's/\.//')

# First input should be a number or MUTE
# Second input should be - or + to indicate up or down

if [ "$1" = "MUTE" ]; then 
	wpctl set-mute $VOLID toggle
else
	wpctl set-volume $VOLID $1%$2
fi

