#!/bin/bash
# sudo curl -sS https://get.docker.com/ | sh
# echo "your user is $USER"
# sudo usermod -aG docker $USER

# list running applications
echo sudo apt-get install htop
# To watch your distro flavor at terminal
echo sudo apt-get install neofetch

# Tutos YT
# https://www.youtube.com/watch?v=cSi-NOlomLc
# sudo apt install apt-transport-https ca-certificates curl gnupg2 software-properties-common
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# sudo add-apt-repository "deb [arch=x86] https://download.docker.com/linux/ubuntu/ $(lsb_release -cs) stable"
# sudo docker pull lancachenet/monolithic
# sudo docker pull lancachenet/lancache-dns
# sudo docker run --restart unless-stopped --name lancache --detach -v /srv/pool/cache:/data/cashe -v /srv/pool/cache/logs:/data/logs -p 8080:8080 lancachenet/monolithic:latest
# sudo docker run --restart unless-stopped --name lancache-dns --detach -p 53:53/udp -e USE_GENERIC_CACHE=true -e LANCACHE_IP=192.168.1.6 lancachenet/lancache-dns:latest

# Server static ip:
# Steam 10.20.0.70
# origin 10.20.0.71
# Battle.net 10.20.0.72
# Riot games 10.20.0.73
# uPlay 10.20.0.74
# windows Update 10.20.0.75
 
# Go to Network > select you MAC_ADRESS > wired > + 
# Then
# IPV4, method(manual), dns 1.1.1.1 > adding all the statics IP's at Addresses, with Netmask as 255.255.255.0 gateway only steam 192.168.1.1


echo sudo apt-get install openssh-server
echo sudo service ssh start

# Overclocking
echo sudo apt install cpufrequtils lm-sensors

# To use it avery mode: 
# powersave
# conservative
# ondemand
# performance

echo sudo cpufreq-set -r -g performance

# To watch the status use:
# Clock CPU
#  watch grep \"cpu MHz\" /proc/cpuinfo
# Temperature
# watch sensors


# Configuration at close the Notebook screen (panelscreen)
# Content from https://www.edivaldobrito.com.br/configurar-ubuntu-para-desligar-quando-tampa-laptop-fechada/

echo sudo vim /etc/systemd/logind.conf

# search for parameter HandleLidSwitch add an conportament to
# Shutdown:
# HandleLidSwitch=poweroff
# Hibernate (default)
# HandleLidSwitch=hibernate
# Do nothing when closed
# ex: HandleLidSwitch=ignore

# sudo restart systemd-logind
# or
echo systemctl restart systemd-logind.service

# Some laptops don't use the hibernate funtion so use it:
echo sudo pm-hibernate