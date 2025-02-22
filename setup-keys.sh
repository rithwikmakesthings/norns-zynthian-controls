#!/bin/bash

# Install WiringPi
git clone https://github.com/zynthian/WiringPi.git
cd WiringPi
./build
cd ..

# Build gpio_keyd.
cd gpio_keyd
make
sudo make install
cd ..

# Copy symlink rule for keys device.
sudo cp 29-keys.rules /etc/udev/rules.d/

# Add service.
sudo cp norns-keys.service /etc/systemd/system/
sudo systemctl enable norns-keys.service
