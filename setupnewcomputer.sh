#!/bin/bash

echo "Running initial update and upgrade of package manager"
sudo apt-get update
sudo apt-get upgrade -y
echo

echo "Installing core stuff"
echo "\txorg\n\ti3\n\tlightdm\n\talacritty\n\tvim\n\tnetwork-manager\n\tgh\n\tzsh & zsh-syntax-highlighting\n\tpicom\n\tstow\n\tpulseaudio & pavucontrol\n\tblueman & libspa-0.2-bluetooth\n\tzip\n\tgpg\n\tufw\n\tthunar"
sudo apt-get install xorg i3 lightdm alacritty vim network-manager gh zsh zsh-syntax-highlighting picom stow pulseaudio pavucontrol blueman libspa-0.2-bluetooth zip gpg ufw thunar -y 2>/dev/null
echo

echo "Enabling lightdm"
sudo systemctl enable lightdm
echo

echo "Enabling NetworkManager"
sudo systemctl enable NetworkManager
echo

echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo

echo "Adding Brave browser to apt source listi, then downloading"
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt-get update
sudo apt-get install brave-browser
echo

echo "Adding Spotify to apt source list, then downloading"
curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update
sudo apt-get install spotify-client
echo
