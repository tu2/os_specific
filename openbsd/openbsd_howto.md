# OpenBSD
## Basic settings after installation

### Add user

(read man adduser)


Add users interactively
```shell
adduser
```
Remove users interactively
```shell
rmuser
```
Manage groups (/etc/group)

Members in wheel group can use su(1) to become root. 

```shell
group [add|del|info|mod] foobar
```

### Add user to wheel
(If the user was not created during the installation, not so sure this is necessary)

```bash
usermod -G wheel user_name
```

### Enable _doas_ (openbsd replacement for sudo)
Become root and edit doas.conf
if it's not created, create it __/etc/doas.conf__

```bash
su -l

echo "permit setenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel" >> /etc/doas.conf
```
### Wireless network setup

***ifconfig*** to find the wireless network interface (let's say ***iwn0***)

```
fw_update

ifconfig iwn0 up
ifconfig iwn0 scan

ifconfig iwn0 nwid YOUR_SSID wpakey "YOUR_PASSPHRASE"
dhclient iwn0

```
To make the configuration persistent create ***/etc/hostname.iwn0*** with the following:

```
join "YOUR_SSID" wpakey "YOUR_PASSPHRASE"
# you can specify other networks here too, in order of priority:
# join "WORK_SSID" wpakey "WORK_PASSPHRASE"
# join "OPEN_COFFEE_SHOP"
dhcp
inet6 autoconf
up powersave

```
Test:

```
ifconfig em0 down
ifconfig iwn0 down
pkill dhclient
sh /etc/netstart
```

### Manage packages
***pkg_add(1), pkg_delete(1), pkg_info(1), installurl(5)***

By default, the /etc/installurl file already contains an OpenBSD mirror server URL
https://cdn.openbsd.org/pub/OpenBSD

Add a repository:

```bash
su -l
echo "https://www.mirrorservice.org/pub/OpenBSD" >> /etc/installurl
```

Install a package:

```bash
doas pkg_add program
```
List packages installed
```bash
pkg_info
```
Search for packages
```bash
pkg_info -Q program
```
List files installed by a package
```bash
pkg_info -L program
```
View install-message for a specific package
```bash
pkg_info -M program
```
Delete a package
```bash
pkg_delete program
```
Show unused dependencies
```bash
pkg_delete -an
```

## Security updates

```bash
doas syspatch

pkg_add -u
```

## Upgrade

**sysupgrade(8)** is a utility to upgrade OpenBSD to the next release or a new snapshot

```bash

doas sysupgrade

```


## Routing

Show the routing table (ipv4)
```bash
route -n show -inet
```
Show the routing table (ipv6)

```bash
route -n show -inet6
```
Delete all gateway entries from the routing table
```bash
route -n flush
```
