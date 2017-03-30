#!/bin/bash
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
	if [ "$cuenta" -lt "3" ] && [ "$procesado" == "1" ]
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
