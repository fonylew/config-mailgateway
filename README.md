# config-mailgateway

Login as root

## Virtual Box
For ssh access without vrdp.

``` bash
VBoxHeadless --startvm FreeBSD --vrdp=off
```
[This guide](https://leemendelowitz.github.io/blog/ubuntu-server-virtualbox.html)
After that you can login with:
```ssh -p 2222 root@localhost```

## Installing postfix

``` bash
cd /usr/ports/mail/postfix
make install clean
```

### Config files for postfix are located in /etc/postfix
` main.cf` `master.cf`

##### using postfix with different user
set usernames and their mails in `virtual` file
after that run this command `postmap /etc/postfix/virtual` for applying change in the file.

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

originally, the recommend method to update is 
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

## procmail
edit file main.cf

```
mailbox_command = /usr/local/bin/procmail

```

## SA-Learn
edit .procmailrc so that it can classify spam in to Spam folder.

```
sa-learn --no-sync --spam ~/Maildir/Spam/{cur,new}
sa-learn --no-sync --ham ~/Maildir/{cur,new}
```

## ADD Crontab
```
#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "00 09 * * 1-5 echo hello" >> mycron
#install new cron file
crontab mycron
rm mycron
```
=======
sa-learn --no-sync --spam /home/user3/Maildir/Spam/{cur,new}
sa-learn --no-sync --ham /home/user3/Maildir/{cur,new}
```

## Crontab
tested on user3
`crontab -e`

```
#Auto learn

```
0 * * * *          /usr/local/bin/sa-learn --spam /home/user3/Maildir/Spam/{cur,new} 2>&1 > /dev/null
0 * * * *          /usr/local/bin/sa-learn --ham /home/user3/Maildir/{cur,new} 2>&1 > /dev/null
```

### List all user
` cat /etc/passwd | grep /home | cut -d: -f1 `


## FreeBSD again
In order to install Maia Mailguard
you have to install these packages:

``` bash
pkg install p5-Unix-Syslog
pkg install p5-MIME-Tools
pkg install p5-Convert-TNEF
pkg install p5-Convert-UUlib
pkg install p5-Net-CIDR-Lite
pkg install p5-forks
pkg install p5-Archive-Zip
pkg install p5-IO-stringy
pkg install p5-IO-Socket-INET6
pkg install p5-Text-CSV
pkg install p5-Data-UUID
pkg install p5-Template-Toolkit
pkg install p5-Net-Server
pkg install p5-Sub-Uplevel
pkg install p5-TestException
pkg install p5-locale-gettext
pkg install help2man
pkg install php5
pkg install pear

pkg install pear-Mail_Mime
pkg install png
pkg install php56-gd
pkg install pear-Image_Color

pkg install p5-DBI
pkg install p5-DBD-mysql

pkg install netpbm
pkg install spamassassin
pkg install p5-FuzzyOcr-devel
pkg install p5-ExtUtils-CBuilder
pkg install p5-Encode-Detect

pkg install p5-BerkeleyDB
pkg install p5-Geography-Countries
pkg install p5-IP-Country

pkg install p5-Crypt-OpenSSL-Bignum
pkg install p5-Crypt-OpenSSL-RSA
pkg install p5-Mail-DomainKeys

pkg install p5-URI
pkg install p5-Mail-SPF
pkg install mysql56-server
```