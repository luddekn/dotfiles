#!/bin/bash

# Running initial update and upgrade
yay -Syu

# Installing stuff
sudo pacman -S nvidia-settings xorg i3 liquidctl stow alacritty lsd tmux dmenu flameshot picom pulseaudio pulseaudio-bluetooth pavucontrol zip unzip ufw xorg-xinit ttf-jetbrains-mono-nerd nodejs-lts-jod npm github-cli usbutils bluez-utils timeshift xclip mariadb 

yay -S rtl8761b-firmware brave-bin
sudo systemctl enable bluetooth.service
echo btusb | sudo tee /etc/modules-load.d/btusb.conf

echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo

yay -Sc
