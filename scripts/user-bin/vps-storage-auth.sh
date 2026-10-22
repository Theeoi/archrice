#!/usr/bin/env bash

key="$HOME/.ssh/id_ed25519"

prompt() {
    printf '\n            VPS-Storage SSH Authentication\n'
    printf '            ------------------------------\n\n'

    ssh-add "$key"
}

if [[ "${1:-}" == "--prompt" ]]; then
    prompt
    exit $?
fi

# Determine which identity we need.
fingerprint=$(ssh-keygen -lf "$key.pub" | awk '{print $2}') || exit 1

# No prompt if the key is already available.
if ssh-add -l 2>/dev/null | grep -Fq "$fingerprint"; then
    exit 0
fi

# Open a terminal to request the SSH key passphrase.
alacritty --class vps-auth --title "VPS-Storage SSH Authentication" \
    -e "$0" --prompt || exit 1

# Continue only if the correct identity was loaded.
ssh-add -l 2>/dev/null | grep -Fq "$fingerprint"
