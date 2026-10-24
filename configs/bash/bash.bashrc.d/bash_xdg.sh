#!/usr/bin/env bash
# script from hiphish.github.io "Making bash xdg compliant"
_confdir=${XDG_CONFIG_HOME:-$HOME/.config}/bash
_datadir=${XDG_DATA_HOME:-$HOME/.local/share}/bash

[[ -r "$_confdir/bashrc" ]] && . "$_confdir/bashrc"

[[ ! -d "$_datadir" ]] && mkdir -p "$_datadir"
HISTFILE=$_datadir/history

unset _confdir
unset _datadir
