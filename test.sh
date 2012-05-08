sudo add-apt-repository -y ppa:kevin-mehall/pithos-daily
echo "deb http://repository.spotify.com stable non-free" > /etc/apt/sources.list.d/spotify.list
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4E9CFF4E
sudo apt-get update
sudo apt-get install pithos
sudo apt-get install spotify-client
