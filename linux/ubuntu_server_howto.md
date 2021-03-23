# Ubuntu Server Howto

Official [Ubuntu Documentation](https://help.ubuntu.com/)

## Upgrade to a newer release

```
sudo apt update && apt upgrade -y

sudo do-release-upgrade

sudo apt autoremove

```
Find IP address 'the hard way'
```bash
ip addr show eth0 | grep inet | awk '{ print $2; }' | sed 's/\/.*$//'
```
****

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
***

## Programming tools 
c programming, local development
```bash
sudo apt install build-essential gdb git curl valgrind tmux
```

## Set-up LAMP Server

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
sudo vi /etc/apache2/sites-available/web_domain.conf

<VirtualHost *:80>
    ServerName web_domain
    ServerAlias www.web_domain
    ServerAdmin webmaster@localhost
    DocumentRoot /var/www/web_domain
    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

# To test Apache without a domain name, remove or comment out:
#ServerName 
#ServerAlias 

# Enable the new virtual host
sudo a2ensite web_domain

# Disable Apache’s default website
sudo a2dissite 000-default

# Reload Apache so these changes take effect
sudo systemctl reload apache2

# Test - create file
vi /var/www/web_domain/index.html

# index.html

<html>
  <head>
    <title>web_domain website</title>
  </head>
  <body>
    <h1>Hello World!</h1>
    <p>This is the landing page of <strong>web_domain</strong>.</p>
  </body>
</html>

# Browser -> http://server_domain_or_IP
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
Install/Config PHP, MySQL
```bash
sudo apt-get install php libapache2-mod-php 
sudo apt-get install mysql-server
sudo mysql_secure_installation
```
Modify **DirectoryIndex** on Apache for php files
```bash
sudo vi /etc/apache2/mods-enabled/dir.conf

# /etc/apache2/mods-enabled/dir.conf
<IfModule mod_dir.c>
        DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm
</IfModule>

# Make sure your configuration file doesn’t contain syntax errors
sudo apache2ctl configtest

# Reload Apache
sudo systemctl reload apache2
```
***

**to do:** 

- [x] install mysql
- [x] secure mysql
- [x] install/config php
- [ ] php webframework
- [ ] python web development
- [ ] ruby web development
- [ ] c web development cgi 😃
