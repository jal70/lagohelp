#!/bin/bash
bzcat *.sec.bz2 | awk 'BEGIN{print "#Energy\t Px\t Py\t Pz"}{if($1==0006 || $1==0005){j=sqrt(($2*$2)+($3*$3)+($4*$4)); print j"\t"$2"\t"$3"\t"$4 }}' | sort -g > prueba
