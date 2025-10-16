#!/bin/bash

# Running initial update and upgrade
yay -Syu

# Installing stuff
sudo pacman -S nvidia-settings xorg i3 liquidctl stow lsd tmux dmenu flameshot pavucontrol zip unzip ufw xorg-xinit ttf-jetbrains-mono-nerd usbutils timeshift xclip bluez bluez-utils pipewire pipewire-audio pipewire-pulse pipewire-alsa pipewire-jack wireplumber ripgrep tldr

# Installing dev stuff
sudo pacman -S nodejs-lts-jod npm git github-cli mariadb
# For dotnet stuff
sudo pacman -S dotnet-sdk aspnet-runtime-9.0

yay -S rtl8761b-firmware brave-bin
systemctl --user enable --now pipewire pipewire-pulse wireplumber
sudo systemctl enable bluetooth.service
echo btusb | sudo tee /etc/modules-load.d/btusb.conf

echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo systemctl enable ufw.service # Just in case
echo

yay -Sc
