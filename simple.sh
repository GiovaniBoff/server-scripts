#!/bin/bash
clear

sudo apt-get install htop
echo "Installing neofetch"
sudo apt-get install neofetch

echo "Installing openssh-server"
sudo apt-get install openssh-server
echo "service ssh start"
sudo service ssh start

echo "starting install cpufrequtils lm-sensors"
sudo apt install cpufrequtils lm-sensors

echo "start overclocking"
sudo cpufreq-set -r -g performance
