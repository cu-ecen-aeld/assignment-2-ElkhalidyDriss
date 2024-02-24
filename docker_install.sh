#!/bin/sh

# Delete existing installations
sudo pacman -Rns docker docker-engine docker-compose

# Set up repos
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
    curl \
    gnupg \
    base-devel

# Install yay AUR helper
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

# Install docker engine
yay -S --noconfirm docker docker-compose

# Start and enable docker service
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Add yourself to the docker group
sudo usermod -aG docker $USER

echo "Please log out and back in for changes to take effect. Then, run the following commands to test your installation:"
cat << EOF
docker run hello-world
EOF
