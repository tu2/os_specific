# OpenBSD
## Basic settings after installation

### Add user

(read man adduser)

Manualy
```shell
user [add|del|info|mod] foobar
```
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
(if the user was not created during the installation)

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

### Install packages
pkg_info(1), pkg_add(1), installurl(5)

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

## Security updates

```bash
doas syspatch

pkg_add -u
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
