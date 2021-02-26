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
  if [ -x "$(command -v apt)" ]; then
    ./tools/install_essentials_apt.sh
  elif [ -x "$(command -v dnf)" ]; then
    ./tools/install_essentials_dnf.sh
  elif [ -x "$(command -v yum)" ]; then
    ./tools/install_essentials_yum.sh
  elif [ -x "$(command -v pacman)" ]; then
    echo "This part not developed. Coming soon..."
  fi
else
  echo "Skipping essentials installation..."
fi

# Set up AutoKey shortcuts
echo $'\n--------------------------------\n'
echo "Configure AutoKey? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  sudo cp -a ./tools/autokey_files/. $HOME/.config/autokey/data/Sample\ Scripts
  autokey
else
  echo "Skipping AutoKey configuration..."
fi

# Install logid
echo $'\n--------------------------------\n'
echo "Install logid (Logitech Options for Linux by PixlOne)? (y/n): "; read answer
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
