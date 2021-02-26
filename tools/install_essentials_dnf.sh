#/bin/bash

echo "Adding epel repository..."
sudo dnf install epel-release
echo "Updating installed apps..."
sudo dnf -y upgrade
echo "Installing essentials..."
sudo dnf install virtualenv git htop vlc gcc-c++ autokey-gtk
echo "INFO: Microsoft core fonts have not been installed."