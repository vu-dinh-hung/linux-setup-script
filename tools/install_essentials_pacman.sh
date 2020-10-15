#!/bin/bash

# microsoft core fonts
sudo pacman -S git base-devel
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts
makepkg -sri
