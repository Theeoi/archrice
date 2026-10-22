#!/usr/bin/env bash

if [[ "$1" == "pre" &&
    "$2" == "suspend-then-hibernate" &&
    "${SYSTEMD_SLEEP_ACTION:-}" == "hibernate" ]]; then
    logger -t hibernate-delay "Waiting 5 seconds before hibernation"
    sleep 5
fi
