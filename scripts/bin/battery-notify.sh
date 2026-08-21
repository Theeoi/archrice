#!/usr/bin/env bash

readonly BAT_DEVICE="/org/freedesktop/UPower/devices/DisplayDevice"
readonly STATE_FILE="${XDG_RUNTIME_DIR}/battery-notification-state"

check_battery() {
    local state percentage last=""

    # Collect relevant variables from upower
    read -r state percentage < <(
        upower --show-info "$BAT_DEVICE" |
            awk '
                $1 == "state:" {
                    state = $2
                }
                $1 == "percentage:" {
                    gsub(/%/, "", $2)
                    percentage = int($2)
                }
                END {
                    print state, percentage
                }
            '
    )

    # Don't do anything if we could not read from upower
    [[ -n "$state" && -n "$percentage" ]] || return

    # Reset the state if we are charging.
    # Don't do anything during undefined state
    case "$state" in
    charging | fully-charged | pending-charge)
        rm -r "$STATE_FILE"
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
    if ((percentage <= 20)); then
        if [[ "$last" != "20" ]]; then
            if notify-send \
                --urgency=high \
                "Battery is critically low" \
                "Battery is at ${percentage}%"; then
                printf '%s\n' 20 >"$STATE_FILE"
            fi
        fi
    elif ((percentage <= 35)); then
        if [[ -z "$last" ]]; then
            if notify-send \
                --urgency=normal \
                "Battery is low" \
                "Battery is at ${percentage}%"; then
                printf '%s\n' 35 >"$STATE_FILE"
            fi
        fi
    fi
}

check_battery

while IFS= read -r _; do
    check_battery
done < <(upower --monitor)
