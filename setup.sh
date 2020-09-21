#!/bin/bash

echo "Starting setup script..."

# Resize swap
echo $'\n--------------------------------\n'
echo "Do you want to resize swap? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  sudo ./tools/resize_swap.sh
else
  echo "Skipping swap resize..."
fi

# Install essentials
echo $'\n--------------------------------\n'
echo "Install essential apps? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  echo "Adding universe and multiverse repositories..."
  sudo add-apt-repository universe
  sudo add-apt-repository multiverse
  sudo apt update
  sudo apt install virtualenv git htop vlc ttf-mscorefonts-installer g++
else
  echo "Skipping install essentials..."
fi

# Install logid
echo $'\n--------------------------------\n'
echo "Install logid? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  cd tools
  ./install_logid.sh
  cd ..
else
  echo "Skipping install logid..."
fi

# Wait for user input to close
echo $'\n--------------------------------\n'
echo "Finished script. Press enter to continue"; read nothing
exit 0
