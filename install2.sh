pkg install procmail
pkg install mutt

#handling user here
pkg install redis
./userconf.sh
echo 'redis_enable="YES"' >> /etc/rc.conf

