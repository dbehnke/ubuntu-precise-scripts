sudo apt-get purge nvidia-current
sudo add-apt-repository -y ppa:ubuntu-x-swat/x-updates
sudo add-apt-repository -y ppa:bumblebee/stable
sudo apt-get update

sudo apt-get install bumblebee bbswitch-dkms virtualgl

#32bit libraries
sudo apt-get install virtualgl-libs:i386 libgl1-mesa-glx:i386 libc6:i386

sudo usermod -a -G bumblebee dbehnke
