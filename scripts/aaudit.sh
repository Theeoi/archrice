#!/bin/bash

set -euo pipefail

TARGET="${1:-$HOME/.cache/auditnum.txt}"
TMP="$(mktemp '${TARGET}.tmp.XXXXXX')"

cleanup() {
    rm -f "$TMP"
}
trap cleanup EXIT

if arch-audit > "$TMP"; then
    count=$(wc -l < "$TMP" | tr -d '[:space:]')
    printf '%s\n' "$count" > "${TMP}.out"
    mv -f "${TMP}.out" "$TARGET"
else
    logger -t arch-audit "arch-audit failed, keeping previous $TARGET"
    exit 1
fi
