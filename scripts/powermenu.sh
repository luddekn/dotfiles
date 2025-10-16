#!/bin/bash

choice=$(echo -e "1:Shutdown\n2:Reboot" | dmenu -nb "#000000" -sb "#ffffff" -sf "#000000" -fn "JetBrainsMono Nerd Font-14" -i -p "Power:")

case "$choice" in
*1:Shutdown) systemctl poweroff ;;
*2:Reboot) systemctl reboot ;;
*1) systemctl poweroff ;;
*2) systemctl reboot ;;
*) exit 1 ;;
esac
