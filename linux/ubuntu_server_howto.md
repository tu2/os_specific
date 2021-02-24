# Ubuntu Server Howto

Official [Ubuntu Documentation](https://help.ubuntu.com/)

## Upgrade to a newer release

```
sudo apt update && apt upgrade -y

sudo do-release-upgrade

sudo apt autoremove

```
## Remove Snap 

Nothing against **Snap**, but I don't want it for my server

```
# Check for installed snap packages
snap list

# Remove snap packages
sudo snap remove --purge package-name

# Clear the snap cache
sudo rm -rf /var/cache/snapd/

# Uninstall snap and snap GUI tool
sudo apt autoremove --purge snapd gnome-software-plugin-snap

# Clear snap preferences
rm -fr ~/snap

# Put snap on hold. Holding a package prevents it from being installed or upgraded automatically
sudo apt-mark hold snapd
```
## Programming tools 
c programming, local development
```bash
sudo apt install build-essential gdb git curl valgrind tmux
```
## Set-up LAMP

**Install/Config Apache**
```bash
sudo apt update
sudo apt install apache2

```
Create a Virtual Host for Website
```bash
# Create the directory for web_domain:
sudo mkdir /var/www/web_domain

# Assign ownership of the directory with the $USER environment variable, which will reference your current system user:
sudo chown -R $USER:$USER /var/www/web_domain

# Configure file in Apache’s sites-available directory
sudo vi /etc/apache2/sites-available/webr_domain.conf

<VirtualHost *:80>
    ServerName web_domain
    ServerAlias www.web_domain
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/web_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

```
Update the Firewall
```bash
# List all currently available UFW application profiles
sudo ufw app list

# To only allow traffic on port 80, use the Apache profile:
sudo ufw allow in "Apache"

# Verify the change:
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
