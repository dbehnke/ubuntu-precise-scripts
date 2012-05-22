#!/bin/bash
#Last Modified 5/17/2012

#ppa customization

#y-ppa-manager for managing ppas
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

#newsgroup reader
sudo add-apt-repository -y ppa:jcfp/ppa

#change default behavior - minimize on unity button click
#sudo add-apt-repository ppa:ojno/unity-minimize-on-click

#wine
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

#pithos (pandora client)
sudo add-apt-repository -y ppa:kevin-mehall/pithos-daily

#faenza icons
sudo add-apt-repository -y ppa:tiheum/equinox

#run an update
sudo apt-get update

#software in standard repositories / ppa mixed

sudo apt-get install build-essential terminator light-themes geany \
chromium-browser gpodder \
vim git bzr bzr-git mercurial python3 pidgin firefox thunderbird \
shotwell rhythmbox aptitude synaptic ubuntu-restricted-extras \
ppa-purge keepassx cpufrequtils \
nautilus-dropbox laptop-mode-tools \
network-manager-openconnect-gnome task vlc htop powertop pithos \
fonts-droid

#software in ppas only

#icons
sudo apt-get install faenza-icon-theme

#y-ppa-manager
sudo apt-get install y-ppa-manager

#newsgroup reader
sudo apt-get install sabnzbdplus

#fix to make all items show up in Startup Applications dialog
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop


