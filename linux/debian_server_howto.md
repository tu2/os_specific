# Debian howto
## Upgrade to the latest version using command line

Variant 1 is the best

### Variant 1
check os version: 
```bash
uname -mrs
lsb_release -a

```
update installed packages
```bash
sudo apt update
sudo apt upgrade
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
reconfigurations APT source-list /etc/apt/source.list
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
check for errors

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
## Programming tools 
c programming
```bash
sudo apt install build-essential git curl valgrind
```
php
```bash
sudo apt-get install php libapache2-mod-php 
sudo apt-get install mysql-server
sudo mysql_secure_installation
```

## Networking
```bash
ip address show
```
