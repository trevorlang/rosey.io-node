echo "Updating to latest packages..."

sudo apt-get update
sudo apt-get upgrade

echo "Installing dependencies..."

sudo apt-get install --no-install-recommends git
sudo apt-get install --no-install-recommends nodejs
sudo apt-get install --no-install-recommends parallel
sudo apt-get install --no-install-recommends xserver-xorg x11-xserver-utils xinit openbox
sudo apt-get install --no-install-recommends chromium-browser

echo "Copying bash settings..."

sudo cp -f ~/rosey.io-node/config/bash/.bash_profile ~/.bash_profile

echo "Configuring Openbox setup script..."

sudo cp -f ~/rosey.io-node/config/openbox/autostart ../../../etc/xdg/openbox/autostart

