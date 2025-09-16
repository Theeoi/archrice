#!/bin/sh

# store explicitly installed packages
pacman -Qe > installed.txt

cp -a $XDG_CONFIG_HOME/alacritty/alacritty.toml ./configs
cp -a $XDG_CONFIG_DIRS/fuzzel/fuzzel.ini ./configs
cp -a /etc/greetd/config.toml ./configs
cp -a /etc/niri/config.kdl ./configs
cp -a $XDG_CONFIG_HOME/swaylock/config ./configs
cp -a $HOME/images/wallpapers .
cp -a $XDG_CONFIG_HOME/vim/vimrc ./configs
cp -a $XDG_CONFIG_DIRS/waybar ./configs
cp -a $XDG_CONFIG_HOME/bash/bashrc ./configs
cp -a $XDG_CONFIG_DIRS/user-dirs.defaults ./configs
