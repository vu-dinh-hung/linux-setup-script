#!/bin/bash


SWAP_TYPE=$(swapon -s | tail -1 |  awk '{print $2}' | cut -d '/' -f 2)
if [ "$SWAP_TYPE" == "file" ]; then
  choice=0
  while ! [[ "$choice" =~ ^[1-5] && $choice -lt 6 ]]
  do
    echo $'Choose size (1-5):\n1. 2GiB \t2. 4GiB \t3. 8GiB \t4. 16GiB \t5. 32GiB'; read choice
    if [[ "$choice" =~ [1-5] && $choice -lt 6 ]]; then
      SWAP_SIZE=$[2**$choice*1024]
      echo "Resizing swap to $SWAP_SIZE MiB..."
      swapoff -a
      sudo dd if=/dev/zero of=/swapfile bs=1M count=$SWAP_SIZE
      sudo chmod 0600 /swapfile
      sudo mkswap /swapfile
      sudo swapon -a
    else
      echo "Invalid choice. Choose a number from 1 to 5."
    fi
  done
else
  echo "Not using swap file, skipping..."
fi