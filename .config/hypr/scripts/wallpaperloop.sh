#!/bin/bash


set -e

snore() {
	local IFS
	[[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
	read -r ${1:+-t "$1"} -u $_snore_fd || :
}

# 30 min delay
DELAY=1800

papermizer ~/Pictures/Wallpapers/
while snore $DELAY; do
	hyprctl hyprpaper unload all
	papermizer ~/Pictures/Wallpapers/
		
done

exit 0
