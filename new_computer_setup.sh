#!/bin/bash

echo "Running initial update and upgrade of package manager"
sudo apt-get update && sudo apt-get upgrade -y
echo

echo "Installing core stuff"
echo -e "\txorg\n\ti3\n\tlightdm\n\tcurl\n\tvim\n\tnetwork-manager\n\tgh\n\tzsh & zsh-syntax-highlighting\n\tpicom\n\tstow\n\tpulseaudio & pavucontrol\n\tblueman & libspa-0.2-bluetooth\n\tzip\n\tgpg\n\tufw\n\tthunar"
sudo apt-get install -y xorg i3 lightdm curl vim network-manager gh zsh zsh-syntax-highlighting picom stow pulseaudio pavucontrol blueman libspa-0.2-bluetooth zip gpg ufw thunar
echo

echo "Enabling lightdm"
if ! systemctl is-enabled --quiet lightdm; then
  sudo systemctl enable lightdm
else
  echo "lightdm is already enabled."
fi
echo

echo "Enabling NetworkManager"
if ! systemctl is-enabled --quiet NetworkManager; then
  sudo systemctl enable NetworkManager
else
  echo "NetworkManager is already enabled."
fi
echo

echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo

echo "Do you want to install Brave and Spotify? (y/n)"
read -r choice

echo "Adding Brave browser to apt source list, then downloading"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg || { echo "Brave key download failed"; exit 1; }
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser -y
echo

echo "Adding Spotify to apt source list, then downloading"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg || { echo "Spotify key download failed"; exit 1; }
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client -y
echo

echo "Removing desktop-base for the removal of default Debian background in grub and i3"
sudo apt-get purge desktop-base -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
