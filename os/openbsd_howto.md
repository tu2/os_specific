# OpenBSD
## Basic settings after installation


### add user to wheel
(if the user is not yet added to wheel)

```bash
usermod -G wheel ~username~
```

### enable _doas_
Become root and edit doas.conf
if it's not created, create the file

```bash
su
password:

vi /etc/doas.conf
```
and add this line: permit *setenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel*

or

```bash
su -l

echo "permit setenv { PKG_PATH ENV PS1 SSH_AUTH_SOCK } :wheel" >> /etc/doas.conf
```

### add a repository (from the internet):
my example:
```bash
export PKG_PATH=http://www.mirrorservice.org/pub/OpenBSD/6.2/packages/amd64/
```

### export path to ~/.profile:
```bash
export PKG_PATH=http://www.mirrorservice.org/pub/OpenBSD/$(uname -r)/packages/$(machine -a)
```

### since 6.1 there is an option for an installurl file (/etc/installurl):
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

## SECURITY

### OpenBSD **syspatch**

```bash
doas syspatch
```

### M:Tier

```bash
curl -O https://stable.mtier.org/openup
chmod +x openup
./openup

pkg_add -u
```

## Other things
