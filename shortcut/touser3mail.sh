echo "TEST MAIL!"
echo "FROM"
read from
echo "SUBJECT:"
read s
echo "DATA"
read data 
(echo "helo example.com"; echo "mail from: $from"; echo "rcpt to: test@example.com"; echo "data";echo "subject:$s"; echo ""; echo ""; echo "$data"; echo ".";sleep 1; echo "quit" )|telnet localhost smtp
sleep 3
cat /var/mail/user3
