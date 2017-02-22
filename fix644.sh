#!/bin/bash
if [ -z "$1" ]
then
	echo -e "USAGE ./fix644.sh ProjectName \n\n(ProjectName from ./do_halley.sh)"
else
	for i in go-$1-*
	do
		sed -i -e 's/644 s/644 \/s/' $i
		done
	fi
