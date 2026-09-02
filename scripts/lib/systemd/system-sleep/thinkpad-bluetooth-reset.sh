#!/usr/bin/env bash

# Only run this script on wake-up from hibernation
state=$1
[ "$state" = "post" ] || exit 0

sleep_type=${SYSTEMD_SLEEP_ACTION:-$2}
[ "$sleep_type" = "hibernate" ] || exit 0

# Bluetooth is controlled by a specific software block. Find the ID.
# If NOT found, exit the script.
platform_rfkill=""
for d in /sys/class/rfkill/rfkill*; do
    [ -r "$d/name" ] || continue

    if [ "$(cat "$d/name")" = "tpacpi_bluetooth_sw" ]; then
        platform_rfkill=$d
        break
    fi
done

[ -n "$platform_rfkill" ] || exit 0

# Only continue if Bluetooth was disabled before hibernation.
[ "$(cat "$platform_rfkill/soft")" = "1" ] || exit 0

# On wake-up, bluetooth hardware is powered on despite software block.
# If it is NOT found, exit the script.
i=0
hci_rfkill=""
while [ "$i" -lt 30 ]; do
    for d in /sys/class/rfkill/rfkill*; do
        [ -r "$d/name" ] || continue

        if [ "$(cat "$d/name")" = "hci0" ]; then
            hci_rfkill=$d
            break
        fi
    done

    [ -n "$hci_rfkill" ] && break

    sleep 0.1
    i=$((i + 1))
done

[ -n "$hci_rfkill" ] || exit 0

# Apply a software block to the bluetooth HCI device.
printf '1\n' >"$hci_rfkill/soft"

logger -t thinkpad-bluetooth-reset "Applied bluetooth software block to hci0"
