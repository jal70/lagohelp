#!/bin/bash
if [ ! -e salida ] || [ ! -d salida ]
then
	echo "crear directorio y archivos"	
	mkdir salida
	> salida/procesados_extraer.dat
	> salida/procesados_descomprimir.dat
fi
if [ ! -e salida/procesados_extraer.dat ]
then
	echo "crear archivo procesados_extraer"
	> salida/procesados_extraer.dat
	fi
if [ ! -e salida/procesados_descomprimir.dat ]
then
	echo "crear archivo procesados_descomprimir"
	> salida/procesados_descomprimir.dat
	fi
