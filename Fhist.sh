#!/bin/bash
OUTPUTFILE=histograma.dat
while [ "$1" != "" ]
do
	case $1 in
	-i)
	INPUTFILE=$2
	;;
	-o)
	OUTPUTFILE=$2
	;;
	-h)
	echo "USO: $./Fhist.sh -i input_file -o archivo_de_salida"
	exit 0
	esac
	# Shift all the parameters down by one
	shift
done
echo $INPUTFILE, $OUTPUTFILE
if [ ! -e $INPUTFILE ]
then
	echo "No existe el archivo de entrada"
else
	awk '/^[^#]/' $INPUTFILE |awk -f dist_energia.awk| column -t > $OUTPUTFILE
	cat $OUTPUTFILE
	fi
