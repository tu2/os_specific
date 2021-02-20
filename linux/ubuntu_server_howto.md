# Ubuntu Server Howto

Official [Ubuntu Documentation](https://help.ubuntu.com/)

## Upgrade to a newer release

```
# apt update && apt upgrade -y

# do-release-upgrade

# apt autoremove

```
## Remove Snap 

Nothing against **Snap**, but I don't want it for my server

**Check for installed snap packages**

```
snap list
```
**Remove snap packages**
```
sudo snap remove --purge package-name
```
Clear the snap cache
```
sudo rm -rf /var/cache/snapd/
```
**Uninstall snap and snap GUI tool**
```
sudo apt autoremove --purge snapd gnome-software-plugin-snap
```

**Clear snap preferences**
```
rm -fr ~/snap
```
**Put snap on hold**

Holding a package prevents it from being installed or upgraded automatically

```
sudo apt-mark hold snapd
```
## Programming tools 
c programming, local development
```bash
sudo apt install build-essential gdb git curl valgrind tmux
```
## Set-up LAMP

Install Apache
```bash
sudo apt update
sudo apt install apache2

```
todo: test apache

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
**to do:** 

* install mysql, secure mysql, install/config php webframework
* python web development
* ruby web development
* c web development cgi :)
