#!/bin/bash

./gpio-dump.py 7 5 > gpio-dump_7.log & ./gpio-dump.py 8 5 > gpio-dump_8.log &
sleep 1
./test.py

first1=`head -n 1 gpio-dump_7.log | cut -f 1`
first2=`head -n 1 gpio-dump_8.log | cut -f 1`

if [ $first1 -le $first2 ]; then
	low=$first1
else
	low=$first2
fi

while read p; do
	  
done <gpio-dump_7.log
	1=`cut -f 1`
cat gpio-dump_7.log | 

head -n 1 gpio-dump_7.log | cut -f 1
gnuplot5 gpio-dump.gnuplot
