host='example.com'
cat /etc/passwd | grep /home | cut -d: -f1  > users
while read p; do
  rm tempcron
  #ln .procmailrc /home/$p/
  #echo $p@$host $p >> /usr/local/etc/postfix/virtual
  #crontab -u $p -l > tempcron
  echo '#sa-learn' >> tempcron
  echo '5 * * * *          /usr/local/bin/sa-learn --spam /home/'$p'/Maildir/Spam/{cur,new} 2>&1 > /dev/null'>> tempcron
  echo '5 * * * *          /usr/local/bin/sa-learn --ham /home/'$p'/Maildir/{cur,new} 2>&1 > /dev/null' >> tempcron
  crontab -u $p tempcron
done <users
#postmap /usr/local/etc/postfix/virtual
rm users
