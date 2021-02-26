#!/bin/bash

# Check if using swap file, disable swap file if true
SWAP_TYPE=$(swapon -s | tail -1 |  awk '{print $2}' | cut -d '/' -f 2)
if ! [ "$SWAP_TYPE" == "file" ]; then
  echo "Not using swap file, here is the current swap config:"
  swapon --show
  echo "Do you want to make a swap file anyway? (y/n): "; read answer
  if ! [ "$answer" == "y" ]; then
    echo "Swap creation cancelled."
    exit 1
  fi
else
  echo "Removing old swap..."
  sudo swapoff --all
fi

choice=0
while ! [[ "$choice" =~ ^[1-5] && $choice -lt 6 ]]
do
  echo $'Swap file will be created at "/swapfile2". Choose size (1-5):\n1. 2GiB \t2. 4GiB \t3. 8GiB \t4. 16GiB \t5. 32GiB'; read choice
  if [[ "$choice" =~ [1-5] && $choice -lt 6 ]]; then
    SWAP_SIZE=$[2**$choice*1024]
    echo "Creating new swap of size $SWAP_SIZE MiB at /swapfile2"
    sudo dd if=/dev/zero of=/swapfile2 bs=1M count=$SWAP_SIZE
    sudo chmod 0600 /swapfile2
    sudo mkswap /swapfile2
    sudo swapon --all
  else
    echo "Invalid choice. Choose a number from 1 to 5."
  fi
done
