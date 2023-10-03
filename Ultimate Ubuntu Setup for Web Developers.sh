#!/bin/bash
# Script to set up a new Ubuntu desktop for Web Developers.

# Setup tested on Ubuntu 22.04.3 LTS Release: 22.04 Codename: jammy
echo "This installation script is created & tested in Ubuntu 22.04.3 LTS Release: 22.04 Codename: jammy by Sudeepta Sarkar on 02/10/2023 i.e. 2nd October 2023"
sleep 3
echo "To know the creator visit https://github.com/sudsarkar13/Ultimate-Ubuntu-Setup-for-Web-Developers"
xdg-open "https://github.com/sudsarkar13/Ultimate-Ubuntu-Setup-for-Web-Developers" 2>/dev/null &
sleep 10
echo
echo "Setup tested on Ubuntu 22.04.3 LTS Release: 22.04 Codename: jammy and as well as it will be updated accordingly with the response."
sleep 2

# Welcome to the Ultimate Ubuntu setup.
echo -n "Enter your name: "
read Your_Name
echo "Welcome to the Ultimate Ubuntu setup \"$Your_Name\""
echo "To continue with the setup you need a high-speed internet connection"
while true; do 
echo -n "So, are you ready to begin with the setup? (Y/N): "
read U_Input  # Corrected the variable name here

# Convert the input to uppercase
U_Input=$(echo "$U_Input" | tr '[:lower:]' '[:upper:]')
    
if [[ "$U_Input" == "Y" ]]; then
echo "Starting the setup..."
# Add your setup steps here or below


# Loop condition do not interfere here highly restricted area keep in mind developers no need to worry you are allowed to modify the code for your convinience.
break
elif [[ "$U_Input" == "N" ]]; then
echo "Exiting the setup in 10 seconds... "
for i in {9..1}; do
echo -n -e "\rRemaining time: $i"
done
echo -e "\rExiting the setup. Goodbye!"
exit 1
break
else
echo "Invalid input. Please enter 'Y' or 'N'."
fi
done

# Installation Procedure beginning from here onwards.

# Fix time operations if windows dual boot found
echo "The sudo timedatectl set-local-rtc 1 command sets the hardware clock (RTC - Real Time Clock) to use local time instead of UTC (Coordinated Universal Time). This is typically necessary in a dual-boot system with Windows and Ubuntu, where Windows usually sets the hardware clock to local time.

By using this command, Ubuntu will read the hardware clock as if it's set to local time, making the time consistent between both operating systems in the dual-boot setup."
echo
sudo timedatectl set-local-rtc 1
sudo timedatectl set-ntp true


# Checks for updates available & upgrades the packages required. 
sudo apt update
sudo apt upgrade -y

# Checks for missing packages required for ubuntu oem or normal installation missed due bad connection or gateway.
sudo apt-get install apt-file -y
sudo apt-file update

# Enables application icon minimize feature on Dock.
echo "Installing minimize-from-icon feature...."
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'

# To undo the action
# gsettings reset org.gnome.shell.extensions.dash-to-dock click-action

# Installing Google Chrome
echo "Getting google-chrome.deb package file..."
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
echo "Installing Google Chrome..."
# Install dependencies
sudo apt update
sudo apt install -y libappindicator3-1 libindicator7
# Install the downloaded .deb package
sudo dpkg -i google-chrome-stable_current_amd64.deb
# Fix any dependency issues
sudo apt --fix-broken install -y
echo "Google Chrome installation completed."
sudo apt autoremove
echo
# Installing flatpak
sudo apt update
echo "Installing Flatpak..."
sudo apt install flatpak -y
# Adding flathub repository
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
echo
# Adding unsnap (Quickly migrate from using snap packages to flatpaks)
echo "Quickly and easily migrate from using snap for applications to flatpak. unsnap runs as a two-stage process. unsnap itself generates the scripts to do the actual migration. This enables users to view and/or edit the scripts prior to execution to validate or tweak them."
echo "Cloning unsnap using git..."
git clone https://github.com/popey/unsnap
cd unsnap
./unsnap
echo
./unsnap auto
echo
cd ..
echo
# Preload
echo "Installs Preload: The preload package in Ubuntu is a daemon that runs in the background and analyzes user behavior to predict which applications you might use next. It then preloads those applications and their dependencies into memory, speeding up their startup times."
echo
# Install Preload
echo "Starting installation of preload..."
sudo apt install preload -y
# Start Preload Service
sudo systemctl start preload
# Enable Preload Service to start on boot
sudo systemctl enable preload
echo
# Installing Python
echo "Installing Python 3..."
# Update package list
sudo apt update
# Install Python 3
sudo apt install python3
echo "Installing pip for python3..."
# Install pip for Python 3
sudo apt install python3-pip
sleep 5
echo
echo "Verifying python installation by checking python version..."
# Verify the installation
python3 --version
echo "Verifying python3-pip installation by checking pip3 version..."
# Verify the installation
pip3 --version
echo
echo "Python 3 installation completed."
echo
# Git install
sleep 5
sudo apt update
# Install Git
sudo apt install git -y
# Display Git version
git --version
echo
# Grub Customizer installation
sudo add-apt-repository ppa:danielrichter2007/grub-customizer
sudo apt install grub-customizer -y
echo
# Installing TimeShift
sudo apt install timeshift -y
echo
# Installing Stacer
sudo apt install stacer -y
echo
