#!/usr/bin/env bash

# Only run this script on wake-up from hibernation
state=$1
[ "$state" = "post" ] || exit 0

sleep_type=${SYSTEMD_SLEEP_ACTION:-$2}
[ "$sleep_type" = "hibernate" ] || exit 0

# Bluetooth is controlled by a specific software block. Find the ID.
# If NOT found, exit the script.
rfkill_id=""
for d in /sys/class/rfkill/rfkill*; do
    [ -r "$d/name" ] || continue

    if [ "$(cat '$d/name')" = "tpacpi_bluetooth_sw" ]; then
        rfkill_id=$d
        break
    fi
done

[ -n "$rfkill_id" ] || exit 0

# Only continue if Bluetooth was disabled before hibernation.
[ "$(cat '$rfkill_id/soft')" = "1" ] || exit 0

# On wake-up, bluetooth hardware is powered on despite software block.
# If it is NOT found, exit the script.
i=0
hci_present=0
while [ "$i" -lt 30 ]; do
    for d in /sys/class/rfkill/rfkill*; do
        [ -r "$d/name" ] || continue

        if [ "$(cat '$d/name')" = "hci0" ]; then
            hci_present=1
            break
        fi
    done

    [ "$hci_present" -eq 1 ] && break

    sleep 0.1
    i=$((i + 1))
done

[ "$hci_present" -eq 1 ] || exit 0

# Reset the software switch to also power off the hardware switch.
printf '0\n' >"$rfkill_id/soft"
sleep 0.5
printf '1\n' >"$rfkill_id/soft"

logger -t thinkpad-bluetooth-reset "Reapplied the ThinkPad bluetooth platform block"
