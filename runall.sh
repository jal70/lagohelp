#!/bin/bash
if [ -z "$1" ]
then
	echo -e "USAGE ./runall.sh ProjectName \n\n(ProjectName from ./do_halley.sh)"
else
	cuantos=0
	for i in go-$1-*.sh
	do
		if [ "$cuantos" -lt "4" ]
		then
			./$i
			let cuantos+=1
		fi
		done
	fi
