_This README.md file is mainly used as documentation for myself to remember certain things_

# Distro

Using Arch Linux, download ISO [here](https://archlinux.org/download/).

## Install

Use Chris Titus's Arch install:

```bash
curl -fsSL christitus.com/linux | sh
```

From this script install Arch Server, and YAY AUR helper.

After installing clone this repository, run the [new_computer_setup.sh](https://github.com/luddekn/dotfiles/blob/main/new_computer_setup.sh) to install packages, then run [set_dotfiles.sh](https://github.com/luddekn/dotfiles/blob/main/set_dotfiles.sh) to link dotfiles using stow.

## Linux Help

A great site that explains various subjects in Linux: [TheLinuxBook](https://thelinuxbook.com/)

# Arch Maintenance

> [!TIP]
> It is recommended to do system maintenance regularly, once a week, saturday. Not recommended to do system maintenance before or in the middle of important work.

For system maintenance go through this list on the [Arch Wiki](https://wiki.archlinux.org/title/System_maintenance).

- Update packages: `yay -Syu`
- Check for orphans and dropped packages: `yay -Qdtq`
  - Remove orphans and dropped packages: `yay -Qdtq | yay -Rns -`
- Detecting more unneeded packages: `yay -Qpd | yay -Rsu --print -`
  - Delete unneeded packages: `yay -Qpd | yay -Rsu -`
- Remove pacman/yay cache: `yay -Scc`

Check for old configuration/cached files:

- `~/.config/` -- Configuration for both installed and removed applications
- `~/.cache/` -- Cache of some programs grow in size, and cache from removed applications can still be here
- `~/.local/share/` -- Old files may be lying here

Generating a good mirrorlist using reflector:

```bash
sudo reflector --country your_country --latest 5 --protocol http --protocol https --sort rate --save /etc/pacman.d/mirrorlist
```

# Security

There is an in-depth security guide on the [Arch Wiki](https://wiki.archlinux.org/title/Security).

### Firewall

Installing a firewall is recommended for anyone using Linux, for example, `ufw`. A classic firewall rule is to deny all incoming, and allow all outgoing:

```bash
sudo ufw enable
sudo ufw default deny incoming
sudo ufw default allow outgoing

sudo systemctl enable ufw.service # Just in case
```

### Root user

Another good practice is to [restrict root login](https://wiki.archlinux.org/title/Security#Restricting_root). You should never use the root account as your main user account, or at all ideally. Why? Because you can do some great irreversible damage to your system, and if someone would get access to your system they would have full control. We should rather be disabling root login, but still have the possibility to use the `sudo` command, if the user is a part of the sudo/wheel group. This allows us to get root privileges for a short period of time in order to do operations that require elevated privileges.

```bash
sudo passwd --lock root
```

### Xorg

Xorg is considered by many to be insecure, and while this is true, it's still used by many. I personally would say that **Xorg is only as insecure as the user using it**, since most of the security flaws mainly relate to user behaviour. We should follow basic security principles by not blindly trusting any application/program, by doing so we could end up being victims of data loss, identity theft, etc.

### Securing GRUB Bootloader

Securing the bootloader is often overlooked, but it's a critical part of Linux system security. If someone gains physical access to your machine, they could bypass authentication at the boot level by modifying boot parameters. You can mitigate this risk by setting a GRUB password, which restricts access to boot options and configuration changes.

> [!NOTE]
> This assumes the user is using GRUB as their bootloader

1. Create a GRUB password:

```bash
sudo grub-mkpasswd-pbkdf2
```

2. Copy the generated hash `grub.pbkdf2.sha512.10000....`
3. Edit the `/etc/grub.d/40_custom` file:

```
#!/bin/sh
exec tail -n +3 $0
set superusers="your_username"
password_pbkdf2 your_username grub.pbkdf2.sha512.10000....
```

4. Lastly, update the GRUB bootloader (This is the Arch way):

```bash
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

# i3 customization

A great resource for general i3 customization:

- [i3-customization](https://itsfoss.com/i3-customization/#change-the-color-scheme-in-the-i3-window-manager)
  Check out these sections:
- "Change theme and icons in the i3 Window manager"
- "Change the color scheme in the i3 window manager"

# ZSH Configuration

Install the following plugins for zsh:

- `sudo pacman -S zsh-autosuggestions zsh-syntax-highlighting`

For a more colorful ls command, install lsd:

```bash
sudo pacman -S lsd
```

# Scripts

Create the `/usr/local/ludde` directory. This is where these scripts should be stored. In `.zsh_profile` there is also a entry for this directory.

### Newnote

Just a simple script to create new markdown notes

```bash
chmod +x newnote
sudo ln -s ~/dotfiles/scripts/newnote /usr/local/ludde/
```

### Sfetch

Just a simple system fetch

```bash
chmod +x sfetch
sudo ln -s ~/dotfiles/scripts/sfetch /usr/local/ludde/
```
