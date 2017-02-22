#!/bin/bash
for i in DAT??????.bz2
do
	j=$(echo $i | sed -e 's/.bz2//')
	u=$(echo $j | sed -e 's/DAT//')
	#echo $i" "$j" "$u
	bzip2 -d -k $i
	echo $j | /home/programs/crktools/lagocrkread | /home/programs/crktools/analysis -p -v $u
	rm $j
	done
