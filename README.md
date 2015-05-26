# config-mailgateway

Login as root

## Installing postfix

``` bash
cd /usr/ports/mail/postfix
make install clean
```

## Installing amavisd-new
You must install pkg for package management by executin `pkg` (for FreeBSD 10+)

``` bash
pkg install amavisd-new
```


## Virtual Box
For ssh access without vrdp.

``` bash
VBoxHeadless --startvm FreeBSD --vrdp=off

VBoxManage setextradata "FreeBSD" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/Protocol" TCP  
VBoxManage setextradata "FreeBSD" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/GuestPort" 22  
VBoxManage setextradata "FreeBSD" "VBoxInternal/Devices/pcnet/0/LUN#0/Config/guestssh/HostPort" 2222 
```
After that you can login with:
``` bash
ssh localhost -p2222
```
