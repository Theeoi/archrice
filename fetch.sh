#!/usr/bin/env bash

# user configs are each their own subtree.
git subtree pull --prefix=configs/alacritty -m "Updated alacritty config subtree" "$XDG_CONFIG_HOME/alacritty" main
git subtree pull --prefix=configs/swaylock -m "Updated swaylock config subtree" "$XDG_CONFIG_HOME/swaylock" main
git subtree pull --prefix=configs/swayidle -m "Updated swayidle config subtree" "$XDG_CONFIG_HOME/swayidle" main
git subtree pull --prefix=configs/bash -m "Updated bash config subtree" "$XDG_CONFIG_HOME/bash" main
git subtree pull --prefix=configs/mako -m "Updated mako config subtree" "$XDG_CONFIG_HOME/mako" main
git subtree pull --prefix=configs/fastfetch -m "Updated fastfetch config subtree" "$XDG_CONFIG_HOME/fastfetch" main
git subtree pull --prefix=configs/nvim -m "Updated nvim config subtree" "$XDG_CONFIG_HOME/nvim" main
git subtree pull --prefix=configs/latexmk -m "Updated latexmk config subtree" "$XDG_CONFIG_HOME/latexmk" main
git subtree pull --prefix=configs/tmux -m "Updated tmux config subtree" "$XDG_CONFIG_HOME/tmux" main
git subtree pull --prefix=configs/systemd -m "Updated systemd config subtree" "$XDG_CONFIG_HOME/systemd/user" main
git subtree pull --prefix=configs/git -m "Updated git config subtree" "$XDG_CONFIG_HOME/git" main
git subtree pull --prefix=configs/obsidian -m "Updated obsidian config subtree" "$HOME/documents/obsidian-vault/.obsidian" main

git subtree pull --prefix=scripts/user-bin -m "Updated user bin subtree" "$HOME/.local/bin" main

rsync -a --delete "$HOME/images/wallpapers" .

# store explicitly installed packages
pacman -Qe >installed.txt

# root-owned configs are not subtrees since using sudo git is not the best idea
rsync -a --delete "$XDG_CONFIG_DIRS/fuzzel/fuzzel.ini" ./configs/fuzzel
rsync -a --delete /etc/greetd/config.toml ./configs/greetd
rsync -a --delete /etc/niri/config.kdl ./configs/niri
rsync -a --delete /etc/vimrc ./configs/vim
rsync -a --delete "$XDG_CONFIG_DIRS/waybar/style.css" ./configs/waybar
rsync -a --delete "$XDG_CONFIG_DIRS/waybar/config.jsonc" ./configs/waybar
rsync -a --delete "$XDG_CONFIG_DIRS/user-dirs.defaults" ./configs/xdg-user-dirs
rsync -a --delete /etc/fonts/local.conf ./configs/fontconfig

rsync -a --delete /usr/local/bin/* ./scripts/bin
rsync -a --delete /usr/local/lib/* ./scripts/lib
