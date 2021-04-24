# Debian Server Howto

Main resource -  [Debian Administrators's Handbook](https://debian-handbook.info/browse/stable/)

## Upgrade to the latest version
0xFFa09A

### Variant 1
Check os version: 
```bash
uname -mrs
lsb_release -a

```
Update installed packages
```bash
sudo apt update && sudo apt upgrade
sudo apt full-upgrade
```
OR 
```bash
apt-get dist-upgrade
```
than, remove unnecessary crust 
```bash
sudo apt --purge autoremove
```
```bash
sudo reboot
```
### Variant 2
Reconfigurations APT source-list /etc/apt/source.list
```bash
sudo cp -v /etc/apt/sources.list /root/
sudo cp -rv /etc/apt/sources.list.d/ /root/

sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list
sudo sed -i 's/stretch/buster/g' /etc/apt/sources.list.d/* !!!

sudo apt update
sudo apt upgrade
sudo apt full-upgrade
sudo apt reboot
sudo apt --purge autoremove
```
Check for errors

```bash
dmesg | egrep -i 'err|warn|critical'
sudo tail -f /var/log/myapp
```

## Verify installed PACKAGE version
```bash
apt list {name}
apt-cache policy {name}
apt-cache madison {name}
dpkg -s {name}
dpkg -s {name} | grep -i version
apt show {name}
```

## Change hostname
```bash
hostnamectl set-hostname {new_name}
```
OR
```bash
vim /etc/hostname
vim /etc/hosts ???
```
## Networking
```bash
ip address show

# the hard way
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```

## Programming tools 
C programming, local development
```bash
sudo apt install build-essential gdb git curl valgrind tmux
```
## Set-up LAMP

Install Apache
```bash
sudo apt update
sudo apt install apache2
```
Configure Firewall
```bash
sudo ufw app list
sudo ufw allow in "Apache"
sudo ufw status
```

Install PHP
```bash
sudo apt-get install php libapache2-mod-php 
sudo apt-get install mysql-server
sudo mysql_secure_installation
```

