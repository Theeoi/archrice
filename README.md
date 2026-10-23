# ArchRice

Collection of configuration files on my Framework 13 Pro running [Arch Linux](https://archlinux.org/) btw..

_Documentation on the main branch might not be up-to-date. Checkout a tagged commit to ensure documentation align with configs._

## Screenshots

![clean desktop](/../_screenshots/v2.0.0/desktop.png)
![busy desktop](/../_screenshots/v2.0.0/desktop2.png)

## Tools in this Rice

- [alacritty](configs/alacritty)
    - everybody needs a terminal emulator.
- [bash](configs/bash)
    - never wrong with a classic.
- [fastfetch](configs/fastfetch)
    - display system information in a pretty way.
- [fuzzel](configs/fuzzel)
    - find the stuff you need.
- [ly](configs/ly)
    - log in with a fancy tui.
- [mako](configs/mako)
    - get notifications on your desktop.
- [niri](configs/niri)
    - expand your screen to infinity.
- [nvim](configs/nvim)
    - edit text like a god.
- [swaylock](configs/swaylock)
    - lock your screen.
- [tmux](configs/tmux)
    - elevate your terminal game.
- [waybar](configs/waybar)
    - get important information at a glance.

_See the full list of explicitly installed packages in [installed.txt](installed.txt)_

## Restoring configurations

Configurations are managed using Git subtrees. To restore a configuration with its Git history intact:

```bash
# Extract the configuration's history
git subtree split --prefix=configs/alacritty -b alacritty-split

# Clone it into the system configuration directory
git clone -b alacritty-split . "$XDG_CONFIG_HOME/alacritty"

# Remove the temporary branch
git branch -D alacritty-split
```

Replace `alacritty` with the desired configuration. For configurations outside `$XDG_CONFIG_HOME`, adjust the destination path accordingly.

Changes can then be synchronized back to `archrice` using `fetch.sh`.
