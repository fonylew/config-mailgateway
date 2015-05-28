(echo "helo example.com"; echo "mail from: fony@example.com"; echo "rcpt to: gun@example.com"; echo "data"; echo "testdata"; echo ".";sleep 1; echo "quit" )|telnet localhost smtp
cat /var/mail/gun

