#!/bin/bash
arr=()
file='yt_trans.txt'
count=0
while read line; do
a=`expr $count%2 | bc`
if [ $a == 0 ];
then 
     arr+=("$line")
fi 
((count=count+1))
done < $file


c=1
i=1
j=0
while read line; do
a=`expr $i%2 | bc`
if [ $a != 0 ];
then echo "" >> new.srt
if [ $c == 20 ]; then exit 
fi
echo "$c" >> new.srt
c=$(($c+1))
echo "$line-->${arr[$(($j+1))]}" >> new.srt
j=$(($j+1))
fi
if [ $a == 0 ];
then echo "$line" >> new.srt 
fi
i=$(($i+1))

done < $file

