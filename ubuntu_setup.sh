#!/bin/bash
echo -e "\n\nScript to install required software and configure ubuntu desktop. \nChoose Y to install or N to abort when prompted.\n\n"
sleep 5
echo -e "\n\nUpdate System\n\n"
sleep 2
sudo apt update
sudo apt upgrade
echo -e "\n\nSetup Flatpak:\n\n"
sleep 2
sudo apt install flatpak -y && sudo flatpak remote-add --if-not-exists flathub http://dl.flathub.org/repo/flathub.flatpakrepo
echo -e "\n\nInstall MS Edge:\n\n"
sleep 2
flatpak install flathub com.microsoft.Edge
echo -e "\n\nInstall GPU drivers:\n\n"
sleep 2
sudo ubuntu-drivers devices
echo -e "\n\nInstall essential packages:\n\n"
sleep 5
sudo apt install build-essential vim nano git wget curl htop net-tools unrar unzip tar 7zip file-roller mousepad
echo -e "\n\nInstall restricted codecs:\n\n"
sleep 5
sudo apt install ubuntu-restricted-extras
echo -e "\n\nSetup UFW Firewall:\n\n"
sleep 2
sudo apt install gufw
sudo systemctl enable ufw && sudo systemctl start ufw && sudo systemctl status ufw
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo grep -E 'POLICY|IPV6' /etc/default/ufw > ~/Desktop/firewall.txt
sleep 5
echo -e "\n\nInstall PostgreSQL:\n\n If installed, use \nsudo -u postgres psql \nto use"
sleep 5
sudo apt install postgresql postgresql-contrib

sudo apt autoremove && sudo apt autoclean && sudo apt purge
echo -e "\n\n\nSetup completed. \nReboot system\n\n"
