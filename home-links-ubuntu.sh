#!/bin/bash

#I have a common directory that I use on another drive/mount point - this script allows me to symbolicly link.  This works out well if you have multiple linux distributions installed or if you want to keep your data seperated from the OS.

cd /home/dbehnke

#sudo pacman -Syu pidgin guake terminator firefox chromium gpodder vim git mercurial thunderbird
#sudo zypper install pidgin guake yakuake terminator firefox chromium gpodder vim git mercurial thunderbird
rm export
ln -s /export/home/dbehnke export

#remove existing directories/symlinks
rm -r -f Development Documents Downloads Music Pictures Public Templates Videos Dropbox Podcasts  opt .cache .purple .thunderbird .mozilla .shotwell .gnupg .ssh .sabnzbd .tasks .tasksrc .VirtualBox "Ubuntu One"

#Private (Encrypted) Stuff

##config directory
cd .config
rm -r -f chromium
rm -r -f gpodder
ln -s ../Private/.config/chromium chromium
ln -s ../Private/.config/gpodder gpodder
cd ..

##home directory
ln -s Private/Development Development
ln -s Private/Music Music
ln -s Private/Pictures Pictures
ln -s Private/Documents Documents
ln -s Private/Dropbox Dropbox
ln -s Private/.purple .purple
ln -s Private/.thunderbird .thunderbird
ln -s Private/.mozilla .mozilla
ln -s Private/.shotwell .shotwell
ln -s Private/.gnupg .gnupg
ln -s Private/.ssh .ssh
ln -s Private/.sabnzbd .sabnzbd
ln -s Private/.cache .cache
ln -s "Private/Ubuntu One" "Ubuntu One"
ln -s Private/.task .task
ln -s Private/.taskrc .taskrc

#Not Encrypted

##home directory
ln -s /export/home/dbehnke/Downloads Downloads
ln -s /export/home/dbehnke/Public Public
ln -s /export/home/dbehnke/Templates Templates
ln -s /export/home/dbehnke/Videos Videos

ln -s /export/home/dbehnke/Podcasts Podcasts
ln -s /export/home/dbehnke/opt opt
ln -s /export/home/dbehnke/.VirtualBox .VirtualBox

#Icons and Desktop Links
mkdir -p .local/share/applications
cd .local/share/applications
rm eclipse.desktop
ln -s /export/home/dbehnke/.local/share/applications/eclipse.desktop eclipse.desktop
cd /home/dbehnke
mkdir .icons
cd .icons
rm eclipse.xpm
ln -s /export/home/dbehnke/.icons/eclipse.xpm eclipse.xpm
