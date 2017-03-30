#!/bin/bash
PARTNMBR=0013
OUTPUTFILE=proton_desordenado.dat
N_OF_PROCFILES=60
while [ "$1" != "" ]
do
	case $1 in
	-p)
	PARTNMBR=$2
	;;
	-f)
	OUTPUTFILE=$2
	;;
	-n)
	N_OF_PROCFILES=$2
	;;
	-h)
	echo "USO: $./extraerparticulas.sh -p codigo_corsika_partícula -n número_de_archivos_a_procesar -f archivo_de_salida"
	exit 0
	esac
	# Shift all the parameters down by one
	shift
done
echo $PARTNMBR, $OUTPUTFILE, $N_OF_PROCFILES
if [ ! -e salida/procesados_extraer.dat ]
then
	echo "No existe el archivo salida/procesados_extraer"
	return 1
	fi
cuenta=0
for i in ??????.sec.bz2
do
	procesado=$(awk 'BEGIN{salida=1}{if($0=="'$i$PARTNMBR'"){salida=0}}END{print salida}' salida/procesados_extraer.dat)
	echo $i $procesado "(0 -> fue procesado, 1 -> no ha sido procesado)"
	if [ "$cuenta" -lt "$N_OF_PROCFILES" ] && [ "$procesado" == "1" ]
	then
		bzcat $i | awk '{if($1=='$PARTNMBR'){j=sqrt(($2*$2)+($3*$3)+($4*$4)); print j"\t"$2"\t"$3"\t"$4 }}' >> $OUTPUTFILE
		echo $i$PARTNMBR >> salida/procesados_extraer.dat
		let cuenta+=1
		fi
	done
