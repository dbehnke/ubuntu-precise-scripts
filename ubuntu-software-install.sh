#!/bin/bash
#Last Modified 5/8/2012

#ppa customization

#unsettings
sudo add-apt-repository -y ppa:diesch/testing

#ubuntu-tweak
sudo add-apt-repository -y ppa:tualatrix/ppa

#unity lenses
#Recoll - full text search tool
sudo add-apt-repository -y ppa:recoll-backports/recoll-1.15-on
#Times and cities and calculator - lets you see time and weather in cities
sudo add-apt-repository -y ppa:scopes-packagers/ppa

#application indicators
#ubuntu one
sudo add-apt-repository -y ppa:rye/ubuntuone-extras
#multiload
sudo add-apt-repository -y ppa:indicator-multiload/stable-daily

#battery life
sudo add-apt-repository -y ppa:webupd8team/jupiter

#y-ppa-manager for managing ppas
sudo add-apt-repository -y ppa:webupd8team/y-ppa-manager

#newsgroup reader
sudo add-apt-repository -y ppa:jcfp/ppa

#change default behavior - minimize on unity button click
#sudo add-apt-repository ppa:ojno/unity-minimize-on-click

#icon set
#http://www.ubuntuvibes.com/2012/04/install-beautiful-fs-icons-set-in.html#more
sudo add-apt-repository -y ppa:kroq-gar78/ppa

#wine
sudo add-apt-repository -y ppa:ubuntu-wine/ppa

#pithos (pandora client)
sudo add-apt-repository -y ppa:kevin-mehall/pithos-daily

#faenza icons
sudo add-apt-repository -y ppa:tiheum/equinox

#run an update
sudo apt-get update

#software in standard repositories / ppa mixed

sudo apt-get install geany gnome-tweak-tool chromium-browser gpodder \
vim git bzr bzr-git mercurial python3 pidgin guake firefox thunderbird \
shotwell rhythmbox aptitude synaptic ubuntu-restricted-extras \
ppa-purge indicator-weather keepassx lo-menubar myunity \
nautilus-dropbox indicator-cpufreq laptop-mode-tools \
network-manager-openconnect-gnome task vlc htop powertop pithos \
gnome-tweak-tool fonts-droid

#software in ppas only

#icons
sudo apt-get install fs-icons-ubuntu fs-icons-ubuntu-mono-dark \
fs-icons-ubuntu-mono-light faenza-icon-theme

sudo apt-get install unsettings 
sudo apt-get install ubuntu-tweak 

#lenses
sudo apt-get install recoll-lens recoll
sudo apt-get install unity-lens-utilities unity-scope-calculator \
unity-scope-cities

#app indicators
sudo apt-get install indicator-ubuntuone
sudo apt-get install indicator-multiload

#battery life
sudo apt-get install jupiter

#y-ppa-manager
sudo apt-get install y-ppa-manager

#newsgroup reader
sudo apt-get install sabnzbdplus

#unity-minmize-on-click
##sudo apt-get upgrade
#uninstall
#sudo ppa-purge ppa:ojno/unity-minimize-on-click

#fix to make all items show up in Startup Applications dialog
sudo sed -i 's/NoDisplay=true/NoDisplay=false/g' /etc/xdg/autostart/*.desktop

#dvd stuff
#sudo /usr/share/doc/libdvdread4/install-css.sh

