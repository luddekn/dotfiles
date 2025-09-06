# i3 Configuration
Go through the [new_computer_setup.sh](https://github.com/luddekn/dotfiles/blob/main/new_computer_setup.sh) script manually, or run it. The packages that **need** to be installed are on the top!

After installing the needed packages, run the [set_dotfiles.sh](https://github.com/luddekn/dotfiles/blob/main/set_dotfiles.sh) script to link all dotfiles to their intended places using stow.
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
```sh
# We install this to get a more colorful "ls" command
sudo dpkg -i <latest release https://github.com/lsd-rs/lsd/releases>
```
