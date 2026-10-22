#!/usr/bin/env bash

readonly BAT_DEVICE="/org/freedesktop/UPower/devices/DisplayDevice"
readonly STATE_FILE="${XDG_RUNTIME_DIR}/battery-notification-state"

check_battery() {
    local state percentage time_to_empty last=""

    # Collect relevant variables from upower
    read -r state percentage time_to_empty < <(
        upower --show-info "$BAT_DEVICE" |
            awk '
                $1 == "state:" {
                    state = $2
                }
                $1 == "percentage:" {
                    gsub(/%/, "", $2)
                    percentage = int($2)
                }
                $1 == "time" && $2 == "to" && $3 == "empty:" {
                    sub(/^[[:space:]]*time to empty:[[:space:]]*/, "")
                    time_to_empty = $0
                }
                END {
                    print state, percentage, time_to_empty
                }
            '
    )

    # Don't do anything if we could not read from upower
    [[ -n "$state" && -n "$percentage" ]] || return

    # Reset the state if we are charging.
    # Don't do anything during undefined state
    case "$state" in
    charging | fully-charged | pending-charge)
        [[ -f "$STATE_FILE" ]] && rm -r "$STATE_FILE"
        return
        ;;
    discharging)
        ;;
    *)
        return
        ;;
    esac

    # Read the latest notification state
    [[ -f "$STATE_FILE" ]] && last=$(<"$STATE_FILE")

    # Define the notification levels and message
    local message="${time_to_empty:+Estimated time remaining: $time_to_empty}"

    if ((percentage <= 10)); then
        if [[ "$last" != "10" ]]; then
            if notify-send \
                --urgency=critical \
                "Battery is critically low (${percentage}%)" \
                "$message"; then
                printf '%s\n' 10 >"$STATE_FILE"
            fi
        fi
    elif ((percentage <= 25)); then
        if [[ -z "$last" ]]; then
            if notify-send \
                --urgency=normal \
                "Battery is low (${percentage}%)" \
                "$message"; then
                printf '%s\n' 25 >"$STATE_FILE"
            fi
        fi
    fi
}

check_battery

while IFS= read -r _; do
    check_battery
done < <(upower --monitor)
