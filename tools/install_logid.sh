#!/bin/bash

GIT_INSTALLED=$(git --version)
echo $GIT_INSTALLED
if ! [[ $GIT_INSTALLED =~ "git version"* ]]; then
  echo "Git is not installed, cannot install logid. Exiting..."
  exit 1
fi

echo "Downloading resources..."
wget https://github.com/vu-dinh-hung/logiops/archive/oneclick_installer.zip

if [ $(echo $?) != "0" ]; then
  echo "Download failed. Exiting..."
  exit 1
fi
echo "Extracting..."
unzip oneclick_installer.zip

if [ $(echo $?) != "0" ]; then
  echo "Extract failed. Exiting..."
  exit 1
fi
cd logiops-oneclick_installer
./install.sh

if [ $(echo $?) != "0" ]; then
  echo "Install failed."
  STATUS=1
else
  echo "Install successful."
  STATUS=0
fi

# Clean up
cd ..
rm -rf logiops-oneclick_installer
rm oneclick_installer.zip

exit $STATUS
