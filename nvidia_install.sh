#!/bin/bash

# Installing liquidctl for controlling CPU cooler
echo "Do you wish to install liquidctl? (y/n)"
read -r liquidctl
if [[ "$liquidctl" == "y" || "$liquidctl" == "Y" ]]; then
    echo "Installing liquidctl"
    sudo nala install liquidctl
    echo
else
    echo "Not installing liquidctl"
fi

# Installing nvidia drivers
echo "Installing prerequisites for Nvidia drivers"
sudo nala install linux-headers-amd64 build-essential dkms
echo "deb http://deb.debian.org/debian/ bookworm main contrib non-free non-free-firmware" | sudo tee -a /etc/apt/sources.list
sudo nala update
sudo nala install nvidia-driver firmware-misc-nonfree
