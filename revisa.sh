#!/bin/bash
for i in *.lst.bz2
do
	bzcat $i | tail -1 | awk '$0!~/^ ========== END OF RUN ================================================$/{print "'$i':KO"}'
	done
