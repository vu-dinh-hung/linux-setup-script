#!/bin/bash

# Resize swap
echo "Do you want to resize swap? (y/n): "; read answer
if [ "$answer" == "y" ]; then
  SWAP_TYPE=$(swapon -s | tail -1 |  awk '{print $2}' | cut -d '/' -f 2)
  if [ "$SWAP_TYPE" == "file" ]; then
    choice=0
    while ! [[ "$choice" =~ ^[1-5] ]]
    do
      echo $'Choose size (5/4/3/2/1):\n5. 32GiB \t4. 16GiB \t3. 8GiB \t2. 4GiB \t1. 2GiB'; read choice
      if [[ "$choice" =~ ^[1-5] ]]; then
        SWAP_SIZE=$[2**$choice*1024]
        swapoff -a
        sudo dd if=/dev/zero of=/swapfile bs=1M count=$SWAP_SIZE
        sudo chmod 0600 /swapfile
        sudo mkswap /swapfile
        sudo swapon -a
      else
        echo "Invalid choice"
      fi
    done
  else
    echo "Not swap file, skipping..."
  fi
else
  echo "Skipping..."
fi

# Install stuff I need
sudo add-apt-repository multiverse
sudo apt update
sudo apt install virtualenv git htop vlc ttf-mscorefonts-installer g++
