host='example.com'
cat /etc/passwd | grep /home | cut -d: -f1  > users
while read p; do
  rm tempcron
  #echo $p@$host $p >> /usr/local/etc/postfix/virtual
  touch /home/$p/user_prefs
  
  #crontab -u $p -l > tempcron
  echo '#sa-learn' >> tempcron
  echo '*/5 * * * *          /usr/local/bin/sa-learn -p /home/'$p'/user_prefs --spam /home/'$p'/Maildir/Spam/{cur,new} > /dev/null 2>&1'>> tempcron
  echo '*/5 * * * *          /usr/local/bin/sa-learn -p /home/'$p'/user_prefs --ham /home/'$p'/Maildir/{cur,new} > /dev/null 2>&1' >> tempcron
  crontab -u $p tempcron
done <users
#postmap /usr/local/etc/postfix/virtual
rm users
