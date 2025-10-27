# Packages to install

```bash
sudo pacman -S nvidia-settings xorg i3 liquidctl stow lsd tmux dmenu flameshot pavucontrol zip unzip ufw xorg-xinit ttf-jetbrains-mono-nerd usbutils timeshift xclip bluez bluez-utils pipewire pipewire-audio pipewire-pulse pipewire-alsa pipewire-jack wireplumber ripgrep zsh-syntax-highlighting
```

Installing bluetooth driver and Brave browser

```bash
yay -S rtl8761b-firmware brave-bin
```

**NB**! Don't forget to enable pipewire and bluetooth

```bash
systemctl --user enable --now pipewire pipewire-pulse wireplumber
sudo systemctl enable bluetooth.service
```

And don't forget to enable the `ufw` firewall, steps in [README.md](https://github.com/luddekn/dotfiles/blob/main/README.md#firewall)

## Remote Desktop

For remote desktop, install the following packages:

```bash
sudo pacman -S remmina freerdp
```

# Installing development stuff

```bash
# Essentials
sudo pacman -S git github-cli mariadb

# NodeJS
sudo pacman -S nodejs-lts-jod npm

# Dotnet
sudo pacman -S dotnet-sdk aspnet-runtime-9.0
```
