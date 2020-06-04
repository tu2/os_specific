# Debian how_to

check os version: 

uname -mrs
lsb_release -a

update installed packages
sudo apt update
sudo apt upgrade
sudo apt full-upgrade OR apt-get dist-upgrade
sudo apt --purge autoremove

sudo reboot

reconfigurations APT source-list /etc/apt/source.list
sudo cp -v /etc/apt/sources.list /root/
sudo cp -rv /etc/apt/sources.list.d/ /root/

sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list
sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/* !!!

sudo apt update
sudo apt upgrade
sudo apt full-upgrade
sudo apt reboot
sudo apt --purge autoremove


----
dmesg | egrep -i 'err|warn|critical'
sudo tail -f /var/log/myapp

## installed PACKAGE version
apt list {name}
apt-cache policy {name}
apt-cache madison {name}

dpkg -s {name}
dpkg -s {name} | grep -i version
apt show {name}

## Change hostname
hostnamectl set-hostname {new_name}
OR
vim /etc/hostname
vim /etc/hosts ???
## Programming tools 
sudo apt install build-essential git curl
## Networking
ip address show
