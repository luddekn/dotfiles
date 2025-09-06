#!/bin/bash

# Running initial update and upgrade
echo "Running initial update and upgrade of package manager"
sudo apt-get update && sudo apt-get upgrade -y
echo

# Installing core essentials
echo "Installing core essentials"
echo -e "\txorg\n\ti3\n\tlightdm"
sudo apt-get install -y xorg i3 lightdm
echo
# Installing extra stuff
echo "Installing extra stuff"
echo -e "\tcurl\n\tvim\t\t\t\t\t//vim text editor\n\tnetwork-manager\n\tgh\t\t\t\t\t//github\n\tzsh & zsh-syntax-highlighting\t\t//zsh shell and syntax highlighting\n\tpicom\t\t\t\t\t//compositor\n\tstow\t\t\t\t\t//used for setting dotfiles\n\tpulseaudio & pavucontrol\t\t//audio controls\n\tblueman & libspa-0.2-bluetooth\t\t//bluetooth stuff\n\tzip\n\tgpg\n\tufw\t\t\t\t\t//firewall\n\tthunar\t\t\t\t\t//file manager\n\tflameshot\t\t\t\t//screenshot tool\n\tmateria-gtk-theme\t\t\t//system theme\n\tlxappearance\t\t\t\t//setting system theme\n\tfonts-noto-color-emoji\t\t\t//emoji support for applications\n\ttmux\t\t\t\t\t//terminal multiplexer"
sudo apt-get install -y curl vim network-manager gh zsh zsh-syntax-highlighting picom stow pulseaudio pavucontrol blueman libspa-0.2-bluetooth zip gpg ufw thunar flameshot materia-gtk-theme lxappearance fonts-noto-color-emoji tmux
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
    sudo apt install cmake g++ pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
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

# Asking user if they want to install Brave browser and Spotify now, could always install later!
echo "Do you want to install Brave and Spotify? (y/n)"
read -r choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo "Adding Brave browser to apt source list, then downloading"
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg || {
        echo "Brave key download failed"
        exit 1
    }
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt-get update
    sudo apt-get install brave-browser -y
    echo

    echo "Adding Spotify to apt source list, then downloading"
    curl -sS https://download.spotify.com/debian/pubkey_6224F9941A8AA6D1.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg || {
        echo "Spotify key download failed"
        exit 1
    }
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update
    sudo apt-get install spotify-client -y
    echo
else
    echo "Not installing Brave or Spotify"
fi

# Removing the desktop-base package to remove the Debian wallpaper on GRUB and background
echo "Removing desktop-base for the removal of default Debian background in grub and i3"
sudo apt-get purge desktop-base -y
sudo apt-get autoremove -y
sudo apt-get autoclean -y
