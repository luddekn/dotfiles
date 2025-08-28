#!/bin/bash

if [ -d "/opt/nvim-linux-x86_64" ]; then
    echo "Remove old nvim version"
    sudo rm -rf /opt/nvim-linux-x86_64
fi

echo "Installing new nvim version"
curl -Lo ~/Downloads/nvim-linux-x86_64.tar.gz https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz

sudo tar -C /opt -xzf ~/Downloads/nvim-linux-x86_64.tar.gz

echo "Creating symlink for nvim in /usr/local/bin"
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

echo "Deleting downloaded file"
sudo rm -rf ~/Downloads/nvim-linux-x86_64.tar.gz
