#!/usr/bin/env bash

set -o pipefail

key="$HOME/.ssh/id_ed25519"

key_loaded() {
    local fingerprint

    # Check if the specific key is available in the ssh-agent.
    fingerprint=$(ssh-keygen -lf "$key.pub" | awk '{print $2}') || return 1
    ssh-add -l 2>/dev/null | grep -Fq "$fingerprint"
}

notify() {
    local action

    # If the key is loaded we can successfully exit
    key_loaded && return 0

    action=$(notify-send --app-name="vps-storage-auth" --expire-time=0 \
        --action="default=Authenticate" "SSH authentication required" \
        "Click to unlock VPS storage.") || return 1

    # Dismissing the notification cancels authentication.
    [[ "$action" == "default" ]] || return 0

    if ! key_loaded; then
        alacritty --class vps-auth --title "VPS-Storage SSH Authentication" \
            -e "$0" --prompt || return 1
    fi

    if key_loaded; then
        systemctl --user start vps-storage.service
    fi
}

prompt() {
    printf '\n            VPS-Storage SSH Authentication\n'
    printf '            ------------------------------\n\n'

    ssh-add "$key"
}

case "${1:-}" in
--check)
    key_loaded
    ;;
--notify)
    notify
    ;;
--prompt)
    prompt
    ;;
*)
    printf 'Usage: %s {--check|--notify|--prompt}\n' "$0" >&2
    exit 2
    ;;
esac
