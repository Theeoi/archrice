#!/bin/sh

# store explicitly installed packages
pacman -Qe > installed.txt

cp -a $XDG_CONFIG_HOME/alacritty/alacritty.toml ./configs/alacritty
cp -a $XDG_CONFIG_DIRS/fuzzel/fuzzel.ini ./configs/fuzzel
cp -a /etc/greetd/config.toml ./configs/greetd
cp -a /etc/niri/config.kdl ./configs/niri
cp -a $XDG_CONFIG_HOME/swaylock/config ./configs/swaylock
cp -a /etc/vimrc ./configs/vim
cp -a $XDG_CONFIG_DIRS/waybar ./configs
cp -a $XDG_CONFIG_HOME/bash/bashrc ./configs/bash
cp -a $XDG_CONFIG_HOME/mako/config ./configs/mako
cp -a $XDG_CONFIG_DIRS/user-dirs.defaults ./configs/xdg-user-dirs
cp -a $XDG_CONFIG_HOME/fastfetch ./configs
cp -a $XDG_CONFIG_HOME/nvim ./configs
cp -a $XDG_CONFIG_HOME/tmux/tmux.conf ./configs/tmux
cp -a $HOME/documents/obsidian-vault/.obsidian.vimrc ./configs/obsidian/obsidian.vimrc
cp -a $HOME/documents/obsidian-vault/.obsidian/{community-plugins,hotkeys}.json ./configs/obsidian

cp -a /usr/local/bin/* ./scripts

cp -a $HOME/images/wallpapers .
