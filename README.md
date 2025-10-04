_This README.md file is mainly used as documentation for myself to remember certain things_

# Distro

Using Arch Linux, download ISO [here](https://archlinux.org/download/).

# Install

Use Chris Titus's Arch install:

```bash
curl -fsSL christitus.com/linux | sh
```

From this script install Arch Server, and YAY AUR helper.

After installing clone this repository, run the [new_computer_setup.sh](https://github.com/luddekn/dotfiles/blob/main/new_computer_setup.sh) to install packages, then run [set_dotfiles.sh](https://github.com/luddekn/dotfiles/blob/main/set_dotfiles.sh) to link dotfiles using stow.

# Arch Maintenance

> [!TIP]
> **NB!** It is recommended to do system maintenance regularly, once a week, saturday. Not recommended to do system maintenance before or in the middle of important work.

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

# Security

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

# i3 customization

A great resource for general i3 customization:

- [i3-customization](https://itsfoss.com/i3-customization/#change-the-color-scheme-in-the-i3-window-manager)
  Check out these sections:
- "Change theme and icons in the i3 Window manager"
- "Change the color scheme in the i3 window manager"

# ZSH Configuration

Install [Oh-My-ZSH](https://ohmyz.sh/#install), remove the autogenreated .zshrc file, go into the dotfiles directory and run the `set_dotfiles` script.

Also make sure to install the following plugins:

- `git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions`
- `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting`

```bash
# We install this to get a more colorful "ls" command
sudo dpkg -i <latest release https://github.com/lsd-rs/lsd/releases>
```

# newnote.sh Script

A copy of the `newnote.sh` script needs to be put in the `/usr/local/ludde` directory:

```bash
sudo mkdir /usr/local/ludde
cp newnote.sh /usr/local/ludde/newnote
sudo chmod +x /usr/local/ludde/newnote
```
