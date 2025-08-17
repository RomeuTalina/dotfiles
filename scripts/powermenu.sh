#! /bin/sh

chosen=$(printf "     Shut Down\n     Restart\n     Log Out\n     Lock" | rofi -dmenu -i -no-config -theme ~/.config/rofi/powermenu.rasi)
  

case "$chosen" in
  "     Shut Down") poweroff ;;
  "     Restart") reboot ;;
  "     Log Out") hyprctl dispatch exit ;;
  "     Lock") slock ;;
  *) exit 1 ;;
esac

