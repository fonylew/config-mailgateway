rm /usr/local/etc/postfix/main.cf
rm /usr/local/etc/postfix/master.cf
rm /usr/local/etc/amavisd.conf
rm /usr/local/etc/mail/spamassassin/local.cf
rm /usr/local/etc/clamd.conf

#aliases file here

ln ./main.cf /usr/local/etc/postfix/
ln ./master.cf /usr/local/etc/postfix/
ln ./amavisd.conf /usr/local/etc/
ln ./clamd.conf /usr/local/etc/
ln ./local.cf /usr/local/etc/mail/spamassassin/

#handling users in vitrual
ln ./virtual /usr/local/etc/postfix/
postmap /etc/postfix/virtual
ln ./aliases.db /etc/

touch /var/log/local0
echo 'local0.info			/var/log/local0'>>/etc/syslog.conf
