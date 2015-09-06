#!/bin/bash
add-apt-repository ppa:ubuntu-clamav/ppa
if [ `uname -m` = x86_64 ]; then
	add-apt-repository ppa:sevenmachines/flash
	apt-get update
	apt-get install flashplugin64-installer -y
fi
add-apt-repository ppa:mozillateam/firefox-stable
add-apt-repository ppa:mozillateam/thunderbird-stable
#add-apt-repository ppa:chromium-daily/ppa
#add-apt-repository ppa:matthaeus123/mrw-gimp-svn
#wget -O - http://deb.opera.com/archive.key | sudo apt-key add -
#sudo sh -c 'echo "deb http://deb.opera.com/opera/ stable non-free" >> /etc/apt/sources.list.d/opera.list'
#add-apt-repository ppa:ubuntu-desktop/gnome3-builds
update.sh
#apt-get install gnome-3-session
#apt-get install clamav
#apt-get install chromium-browser
#apt-get install opera
apt-get upgrade
