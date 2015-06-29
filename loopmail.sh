echo 'To :'
read TO
echo 'note'
read note
i=0
while [ "$i" -lt 10 ] 
do
   echo "$note This is a message $i" | mail $TO -s "$note loop $i"
   echo $i
   i=`expr $i + 1`
done
