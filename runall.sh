#!/bin/bash
if [ -z "$1" ]
then
	echo -e "USAGE ./runall.sh ProjectName \n\n(ProjectName from ./do_halley.sh)"
else
	for i in go-$1-*
	do
		./$i
		done
	fi
