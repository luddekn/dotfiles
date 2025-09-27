#!/bin/bash

# Running initial update and upgrade
sudo pacman -Syu 

# Installing stuff
sudo pacman -S nvidia-settings xorg i3 liquidctl stow alacritty lsd tmux dmenu flameshot picom pulseaudio pulseaudio-bluetooth pavucontrol zip unzip ufw xorg-xinit ttf-jetbrains-mono-nerd nodejs-lts-jod npm github-cli usbutils bluez-utils timeshift xclip mariadb 

echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo

sudo pacman -Sc
