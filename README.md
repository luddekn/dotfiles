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
