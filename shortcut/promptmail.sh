echo "PROMPT MAIL!"
echo "FROM:"
read from
echo "TO:"
read to
echo "SUBJECT:"
read s
echo "DATA:"
read data 
(echo "helo example.com"; echo "mail from: $from"; echo "rcpt to: $to"; echo "data"; echo "subject:$s";echo "";echo ""; echo "$data"; echo ".";sleep 1; echo "quit" )|telnet localhost smtp

