rm /usr/local/etc/postfix/main.cf
rm /usr/local/etc/postfix/master.cf
rm /usr/local/etc/amavisd.conf
rm /usr/local/etc/mail/spamassassin/local.cf

ln ./main.cf /usr/local/etc/postfix/
ln ./master.cf /usr/local/etc/postfix/
ln ./amvisd.conf /usr/local/etc/
ln ./local.cf /usr/local/etc/mail/spamassassin/

touch /var/log/local0
