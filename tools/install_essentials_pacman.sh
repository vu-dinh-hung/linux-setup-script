#!/bin/bash

# not tested yet, probably doesn't work
sudo pacman -S git base-devel
sudo pacman -Syu
sudo pacman -Syy
sudo pacman -S virtualenv git htop vlc ttf-mscorefonts-installer g++ autokey-gtk
# git clone https://aur.archlinux.org/ttf-ms-fonts.git
# cd ttf-ms-fonts
# makepkg -sri
