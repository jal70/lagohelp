#!/bin/bash
cuenta=0
for i in *.lst.bz2
do
	bzcat $i | tail -1 | awk '$0!~/^ ========== END OF RUN ================================================$/{print "'$i':KO"}'
	let cuenta+=1
	done
echo "Hay $cuenta archivos tipo .lst.bz2"
#######
cuenta=0
for i in *.sec.bz2
do
	bzcat $i | tail -1 | awk '$0!~/^\# \# [0-9]+ lines read on [0-9]+ secondaries for [0-9]+ showers$/{print "'$i':KO"}'
	let cuenta+=1
	done
echo "Hay $cuenta archivos tipo .sec.bz2"
