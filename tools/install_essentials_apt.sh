#!/bin/bash

echo "Adding universe and multiverse repositories..."
sudo add-apt-repository universe
sudo add-apt-repository multiverse
sudo apt update
echo "Updating installed apps..."
sudo apt upgrade
echo "Installing essentials..."
sudo apt install virtualenv git htop vlc ttf-mscorefonts-installer g++ autokey-gtk