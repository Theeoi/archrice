#!/usr/bin/env bash

set -euo pipefail

TARGET_DIR="${1:-/var/cache/aaudit}"
[[ ! -d "$TARGET_DIR" ]] && mkdir -p "$TARGET_DIR"
TMP="$(mktemp "${TARGET_DIR}/count.tmp.XXXXXX")"

cleanup() {
    rm -f "$TMP"
}
trap cleanup EXIT

if arch-audit >"$TMP"; then
    count=$(wc -l <"$TMP" | tr -d '[:space:]')
    printf '%s\n' "$count" >"${TMP}.out"
    mv -f "${TMP}.out" "$TARGET_DIR/count"
else
    logger -t arch-audit "arch-audit failed, keeping previous count."
    exit 1
fi
