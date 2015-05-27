cd /usr/ports/mail/postfix
make install clean
ln -s /usr/local/etc/postfix /etc/postfix

pkg
pkg install amavisd-new
pkg install clamav

echo '' >>/etc/rc.conf
echo 'postfix_enable="YES"' >> /etc/rc.conf
echo 'clamav_clamd_enable="YES"' >> /etc/rc.conf
echo 'clamav_freshclam_enable="YES"' >> /etc/rc.conf
echo 'amavisd_enable="YES"' >> /etc/rc.conf
echo 'spamd_enable="YES"' >> /etc/rc.conf
echo 'spamd_flags="-v -q -x -u spamd -H /var/spool/spamd -A 127.0.0.0/24"' >> /etc/rc.conf
echo 'sendmail_enable="NO"'>> /etc/rc.conf
echo 'sendmail_submit_enable="NO"' >> /etc/rc.conf
echo 'sendmail_outbound_enable="NO"' >> /etc/rc.conf
echo 'sendmail_msp_queue_enable="NO"' >> /etc/rc.conf

cd /var/db/spamassassin
mkdir 3.004001
wget apache.claz.org//spamassassin/source/Mail-SpamAssassin-rules-3.4.1.r1675274.tgz
tar -xvf Mail-SpamAssassin-rules-3.4.1.r1675274.tgz
