#!/bin/bash

choice=$(echo -e "Shutdown\nReboot" | dmenu -nb "#000000" -sb "#ffffff" -sf "#000000" -fn "BlexMono Nerd Font-14" -i -p "Power:")

case "$choice" in
    *Shutdown) systemctl poweroff ;;
    *Reboot) systemctl reboot ;;
    *) exit 1 ;;
esac
