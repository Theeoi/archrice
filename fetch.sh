#!/bin/sh

# rsync -a --delete $XDG_CONFIG_HOME/alacritty/alacritty.toml ./configs/alacritty
# rsync -a --delete $XDG_CONFIG_HOME/swaylock/config ./configs/swaylock
# rsync -a --delete $XDG_CONFIG_HOME/bash/bashrc ./configs/bash
# rsync -a --delete $XDG_CONFIG_HOME/mako/config ./configs/mako
# rsync -a --delete $XDG_CONFIG_HOME/fastfetch ./configs
# rsync -a --delete $XDG_CONFIG_HOME/nvim ./configs
# rsync -a --delete $XDG_CONFIG_HOME/latexmk ./configs
# rsync -a --delete $XDG_CONFIG_HOME/tmux/tmux.conf ./configs/tmux

git subtree add --prefix=configs/alacritty "$XDG_CONFIG_HOME/alacritty" main
git subtree add --prefix=configs/swaylock "$XDG_CONFIG_HOME/swaylock" main
git subtree add --prefix=configs/bash "$XDG_CONFIG_HOME/bash" main
git subtree add --prefix=configs/mako "$XDG_CONFIG_HOME/mako" main
git subtree add --prefix=configs/fastfetch "$XDG_CONFIG_HOME/fastfetch" main
git subtree add --prefix=configs/nvim "$XDG_CONFIG_HOME/nvim" main
git subtree add --prefix=configs/latexmk "$XDG_CONFIG_HOME/latexmk" main
git subtree add --prefix=configs/tmux "$XDG_CONFIG_HOME/tmux" main

# store explicitly installed packages
pacman -Qe >installed.txt

rsync -a --delete $HOME/documents/obsidian-vault/.obsidian.vimrc ./configs/obsidian/obsidian.vimrc
rsync -a --delete $HOME/documents/obsidian-vault/.obsidian/{community-plugins,hotkeys}.json ./configs/obsidian

rsync -a --delete $XDG_CONFIG_DIRS/fuzzel/fuzzel.ini ./configs/fuzzel
rsync -a --delete /etc/greetd/config.toml ./configs/greetd
rsync -a --delete /etc/niri/config.kdl ./configs/niri
rsync -a --delete /etc/vimrc ./configs/vim
rsync -a --delete $XDG_CONFIG_DIRS/waybar/style.css ./configs/waybar
rsync -a --delete $XDG_CONFIG_DIRS/waybar/config.jsonc ./configs/waybar
rsync -a --delete $XDG_CONFIG_DIRS/user-dirs.defaults ./configs/xdg-user-dirs

rsync -a --delete /usr/local/bin/* ./scripts

rsync -a --delete $HOME/images/wallpapers .
