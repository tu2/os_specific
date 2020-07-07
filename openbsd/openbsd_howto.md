# OpenBSD
## Basic settings after installation

### Add user

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

### Add a repository (from the internet):
my example:
```bash
export PKG_PATH=http://www.mirrorservice.org/pub/OpenBSD/6.2/packages/amd64/
```

### Export path to ~/.profile:
```bash
export PKG_PATH=http://www.mirrorservice.org/pub/OpenBSD/$(uname -r)/packages/$(machine -a)
```

### Since 6.1 there is an option for an installurl file (/etc/installurl):
```bash
su -l
echo "https://www.mirrorservice.org/pub/OpenBSD" >> /etc/installurl
```

### Install programs:

become **root** and install programs using **pkg_add**:

```bash
pkg_add program_name
```

or install programs using **doas**:

```bash
doas pkg_add program_name
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
