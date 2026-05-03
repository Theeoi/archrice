#!/bin/sh

# user configs are each their own subtree.
git subtree pull --prefix=configs/alacritty "$XDG_CONFIG_HOME/alacritty" main
git subtree pull --prefix=configs/swaylock "$XDG_CONFIG_HOME/swaylock" main
git subtree pull --prefix=configs/bash "$XDG_CONFIG_HOME/bash" main
git subtree pull --prefix=configs/mako "$XDG_CONFIG_HOME/mako" main
git subtree pull --prefix=configs/fastfetch "$XDG_CONFIG_HOME/fastfetch" main
git subtree pull --prefix=configs/nvim "$XDG_CONFIG_HOME/nvim" main
git subtree pull --prefix=configs/latexmk "$XDG_CONFIG_HOME/latexmk" main
git subtree pull --prefix=configs/tmux "$XDG_CONFIG_HOME/tmux" main

# store explicitly installed packages
pacman -Qe >installed.txt

rsync -a --delete $HOME/documents/obsidian-vault/.obsidian.vimrc ./configs/obsidian/obsidian.vimrc
rsync -a --delete $HOME/documents/obsidian-vault/.obsidian/{community-plugins,hotkeys}.json ./configs/obsidian

# root-owned configs are not subtrees since using sudo git is not the best idea
rsync -a --delete $XDG_CONFIG_DIRS/fuzzel/fuzzel.ini ./configs/fuzzel
rsync -a --delete /etc/greetd/config.toml ./configs/greetd
rsync -a --delete /etc/niri/config.kdl ./configs/niri
rsync -a --delete /etc/vimrc ./configs/vim
rsync -a --delete $XDG_CONFIG_DIRS/waybar/style.css ./configs/waybar
rsync -a --delete $XDG_CONFIG_DIRS/waybar/config.jsonc ./configs/waybar
rsync -a --delete $XDG_CONFIG_DIRS/user-dirs.defaults ./configs/xdg-user-dirs

rsync -a --delete /usr/local/bin/* ./scripts

rsync -a --delete $HOME/images/wallpapers .
