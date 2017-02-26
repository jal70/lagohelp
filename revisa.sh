#!/bin/bash
cuenta=0
for i in *.lst.bz2
do
	bzcat $i | tail -1 | awk '$0!~/^ ========== END OF RUN ================================================$/{print "'$i':KO"}'
	let cuenta+=1
	done
echo "Hay $cuenta archivos .lst.bz2"
