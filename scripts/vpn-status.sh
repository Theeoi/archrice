#!/usr/bin/env sh

vpn=$(
    nmcli -t -f NAME,TYPE connection show --active |
    awk -F: '$2 == "vpn" { print $1; exit }'
)

if [ -n "$vpn" ]; then
    tooltip=$(printf '%s' "$vpn" | sed 's/\\/\\\\/g; s/"/\\"/g')
    printf '{"text":"","tooltip":"%s","class":"connected"}\n' "$tooltip"
else
    printf '{"text":"","tooltip":""}\n'
fi

