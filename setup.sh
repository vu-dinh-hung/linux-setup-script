#!/bin/bash

echo "Starting setup script..."

# Resize swap
echo $'\n--------------------------------\n'
echo "Do you want to resize swap? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  sudo ./resize_swap.sh
else
  echo "Skipping swap resize..."
fi

# Install essentials
echo $'\n--------------------------------\n'
echo "Install essential apps? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  sudo add-apt-repository multiverse
  sudo apt update
  sudo apt install virtualenv git htop vlc ttf-mscorefonts-installer g++
else
  echo "Skipping install..."
fi

# Wait for user input to close
echo $'\n--------------------------------\n'
echo "Finished script. Press enter to continue"; read nothing
exit 0
