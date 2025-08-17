#!/bin/bash

## If alacritty.toml does not exist, raise an alert
[[ ! -f ~/.config/alacritty/alacritty.toml ]] && \
    notify-send "alacritty.toml does not exist" && exit 0

## Fetch background_opacity from alacritty.toml
opacity=$(awk -F'=' '/^opacity/ {gsub(/[[:space:]"]/, "", $2); print $2; exit}' \
    ~/.config/alacritty/alacritty.toml)

## Assign toggle opacity value
case $opacity in
  1)
    toggle_opacity=0.95
    ;;
  *)
    toggle_opacity=1
    ;;
esac

## Replace opacity value in alacritty.toml
sed -i -- "s/^opacity.*/opacity = $toggle_opacity/" \
    ~/.config/alacritty/alacritty.toml
echo "message"
