echo deb http://download.virtualbox.org/virtualbox/debian precise contrib > /etc/apt/sources.list.d/virtualbox-precise.list
wget -q http://download.virtualbox.org/virtualbox/debian/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install virtualbox-4.1
sudo usermod -a -G vboxusers dbehnke
