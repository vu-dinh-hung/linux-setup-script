#/bin/bash

echo "Adding epel repository..."
sudo yum install epel-release
echo "Updating installed apps..."
sudo yum -y upgrade
echo "Installing essentials..."
sudo yum install virtualenv git htop vlc gcc-c++ autokey-gtk
echo "INFO: Microsoft core fonts have not been installed."