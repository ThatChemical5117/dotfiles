#!/bin/bash

# when the script is run, it will toggle cmus
function cmusPlayPause
{
    STATUS=$(cmus-remote -Q | grep -a '^status' | awk '{gsub("status ", "");print}')

    if [ "$STATUS" = "playing" ]; then
        $(cmus-remote --pause)
    else
        $(cmus-remote --play)
    fi
}

cmusPlayPause
