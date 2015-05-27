# config-mailgateway

Login as root

## Installing postfix

``` bash
cd /usr/ports/mail/postfix
make install clean
```

### Config files for postfix are located in /etc/postfix
` main.cf` `master.cf`

## Installing amavisd-new
You must install pkg for package management by executin `pkg` (for FreeBSD 10+)

``` bash
pkg install amavisd-new
```

## Installing clamav

``` bash
pkg install clamav
```

----
Add this to /etc/rc.conf

``` bash
clamav_clamd_enable="YES"
clamav_freshclam_enable="YES"

amavisd_enable="YES"
amavisd_ram="512m" #optional
```

## Update spamassassin

```bash
sa-update --channel apache.claz.org//spamassassin/source --install Mail-SpamAssassin-rules-3.4.1.r1675274.tgz
```
but it didn't work
so

```bash
cd /var/db/spamassassin
mkdir 3.004001
wget apache.claz.org//spamassassin/source/Mail-SpamAssassin-rules-3.4.1.r1675274.tgz
tar -xvf Mail-SpamAssassin-rules-3.4.1.r1675274.tgz
```

## Virtual Box
For ssh access without vrdp.

``` bash
VBoxHeadless --startvm FreeBSD --vrdp=off
```
[This guide](https://leemendelowitz.github.io/blog/ubuntu-server-virtualbox.html)
After that you can login with:
```ssh -p 2222 root@localhost```


