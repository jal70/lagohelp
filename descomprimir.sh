#!/bin/bash
NUMBEROFFILES=1
while [ "$1" != "" ]
do
	case $1 in
	-n)
	NUMBEROFFILES=$2
	;;
	-h)
	echo "USO: $nohup ./descomprimir.sh -n numero_de_archivos_a_descomprimir &"
	exit 0
	esac
	# Shift all the parameters down by one
	shift
done
if [ ! -e salida/procesados_descomprimir.dat ]
then
	echo "Ejecute preparaextraccion.sh"
	return 1
	fi
cuenta=0
for i in DAT??????.bz2
do
	procesado=$(awk 'BEGIN{salida=1}{if($0=="'$i'"){salida=0}}END{print salida}' salida/procesados_descomprimir.dat)
	echo $i $procesado "(0 -> fue procesado, 1 -> no ha sido procesado)"
	if [ "$cuenta" -lt "$NUMBEROFFILES" ] && [ "$procesado" == "1" ]
	then
		j=$(echo $i | sed -e 's/.bz2//')
		u=$(echo $j | sed -e 's/DAT//')
		#echo $i" "$j" "$u
		bzip2 -d -k $i
		echo $j | /home/programs/crktools/lagocrkread | /home/programs/crktools/analysis -p -v $u
		rm $j
		echo $i >> salida/procesados_descomprimir.dat
		let cuenta+=1
		fi
	done
