#!/bin/bash

# Legacy name, changed to work with wpctl, based on an example from waybar

set -e

snore() {
    local IFS
    [[ -n "${_snore_fd:-}" ]] || exec {_snore_fd}<> <(:)
    read -r ${1:+-t "$1"} -u $_snore_fd || :
}

DELAY=0.2

while snore $DELAY; do

	WP_OUTPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

	if [[ $WP_OUTPUT =~ ^Volume:[[:blank:]]([0-9]+)\.([0-9]{2})([[:blank:]].MUTED.)?$ ]]; then
		ICON=(
			"󰕾"
			""
			""
			"󰖁"
		)

		if [[ -n ${BASH_REMATCH[3]} ]]; then
			printf "%s\n" ${ICON[3]}
		else
			VOLUME=$((10#${BASH_REMATCH[1]}${BASH_REMATCH[2]}))
		

			if [[ $VOLUME -gt 66 ]]; then
				printf "%s " ${ICON[0]}
			elif [[ $VOLUME -gt 33 ]]; then
				printf "%s " ${ICON[1]}
			elif [[ $VOLUME -gt 0 ]]; then
				printf "%s " ${ICON[2]}
			else
				printf "%s " ${ICON[3]}
			fi

			printf "$VOLUME%%\n"
		fi
	fi
done

exit 0
