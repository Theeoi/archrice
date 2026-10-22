#!/usr/bin/env bash
set -euo pipefail

WALLPAPER_DIR="$HOME/images/wallpapers"
CURRENT_WALLPAPER="$XDG_STATE_HOME/wallpaper/current"

# Store the current wallpaper and it's fine if it does not exist.
current="$(realpath "$CURRENT_WALLPAPER" 2>/dev/null || true)"

# Only consider image-extensions directly in the wallpaper dir
# and ignore the current wallpaper.
next_wallpaper="$(
    find "$WALLPAPER_DIR" -maxdepth 1 -type f \
        \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \) \
        ! -path "$current" |
        shuf -n 1
)"

# If a new wallpaper was found, set it up.
[[ -n "$next_wallpaper" ]] || exit 0

mkdir -p "$(dirname "$CURRENT_WALLPAPER")"
ln -snf "$next_wallpaper" "$CURRENT_WALLPAPER"
systemctl --user restart swaybg.service
