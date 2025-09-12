#!/bin/bash

# Installing nala package manager
echo "Installing Nala package manager"
sudo apt-get install nala
echo

# Fetching mirrors
echo "Fetching mirrors"
sudo nala fetch
echo

# Running initial update and upgrade
echo "Running initial update and upgrade of package manager"
sudo nala update
sudo nala upgrade
echo

# Installing core essentials
echo "Installing core essentials"
echo -e "\txorg\n\ti3\n\tlightdm"
sudo nala install xorg i3 lightdm
echo
# Installing extra stuff
echo "Installing extra stuff"
echo -e "\tcurl\n\tvim\t\t\t\t\t//vim text editor\n\tnetwork-manager\n\tgh\t\t\t\t\t//github\n\tzsh & zsh-syntax-highlighting\t\t//zsh shell and syntax highlighting\n\tpicom\t\t\t\t\t//compositor\n\tstow\t\t\t\t\t//used for setting dotfiles\n\tpulseaudio & pavucontrol\t\t//audio controls\n\tblueman & libspa-0.2-bluetooth\t\t//bluetooth stuff\n\tzip\n\tgpg\n\tufw\t\t\t\t\t//firewall\n\tthunar\t\t\t\t\t//file manager\n\tflameshot\t\t\t\t//screenshot tool\n\tmateria-gtk-theme\t\t\t//system theme\n\tlxappearance\t\t\t\t//setting system theme\n\tfonts-noto-color-emoji\t\t\t//emoji support for applications\n\ttmux\t\t\t\t\t//terminal multiplexer"
sudo nala install curl vim network-manager gh zsh zsh-syntax-highlighting picom stow pulseaudio pavucontrol blueman libspa-0.2-bluetooth zip gpg ufw thunar flameshot materia-gtk-theme lxappearance fonts-noto-color-emoji tmux
echo
# Enabling lightdm on boot
echo "Enabling lightdm"
if ! systemctl is-enabled --quiet lightdm; then
    sudo systemctl enable lightdm
else
    echo "lightdm is already enabled."
fi
echo
# Enabling networkmanager on boot
echo "Enabling NetworkManager"
if ! systemctl is-enabled --quiet NetworkManager; then
    sudo systemctl enable NetworkManager
else
    echo "NetworkManager is already enabled."
fi
echo
# Enabling firewall on boot and setting rules: DENY ALL inc - ALLOW ALL out
echo "Enabling ufw and setting rules"
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing
echo

# Installing alacritty terminal
echo "Do you want to install alacritty? (y/n)"
read -r alacritty

if [[ "$alacritty" == "y" || "$alacritty" == "Y" ]]; then
    # Installing dependencies
    sudo nala install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
    cd
    # Installing rustup
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    # Cloning alacritty git repository
    git clone https://github.com/alacritty/alacritty.git
    ~/.cargo/bin/rustup override set stable
    ~/.cargo/bin/rustup update stable
    # Building alacritty
    cd alacritty
    ~/.cargo/bin/cargo build --release --no-default-features --features=x11
else
    echo "Not installing alacritty"
fi

# Installing nvim editor
echo "Do you want to install nvim? (y/n)"
read -r nvim

if [[ "$nvim" == "y" || "$nvim" == "Y" ]]; then
    cd /opt
    sudo curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
    sudo tar -xzf nvim-linux64.tar.gz
    sudo rm -rf nvim-linux64.tar.gz
else
    echo "Not installing nvim"
fi

# Removing the desktop-base package to remove the Debian wallpaper on GRUB and background
echo "Removing desktop-base for the removal of default Debian background in grub and i3"
sudo nala purge desktop-base
# Post package manager cleanup
echo "Post package manager cleanup"
sudo nala autopurge
sudo nala autoremove
sudo nala autoclean
sudo nala clean
