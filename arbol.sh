#!/bin/bash

# Programa para desplegar directorios en forma de arbol

ESP=0;
if [ $# -eq 0 ]; then
	RUTA=$(pwd);
	DIR=$(basename "$PWD");
else
	RUTA=$1;
	DIR=$(basename "$RUTA");
	if [ $# -ge 2 ];then
		ESP=$2;
		let ESP=$ESP+1;
	fi
fi

if [ $ESP -eq 0 ]; then
	echo ".";
else
	for ((x = 1; x < $ESP; x++)); do
		echo -n -e "\xe2\x94\x82   ";
	done
	if [ $ESP -gt 0 ]; then
		if [ $# -eq 3 ]; then
			echo -n -e "\xe2\x94\x94\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80";
		else
			echo -n -e "\xe2\x94\x9c\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80";
		fi
	fi
	echo $DIR;
fi

PTR_ARCH="";
for d in $(ls $RUTA)
do
	if [ ! -z "$PTR_ARCH" ]; then
		if [ -d "$RUTA/$PTR_ARCH" ]; then
			#CARPETA=$CARPETA;
			#read;
			#echo "$RUTA/$PTR_ARCH Es el directorio";
			./arbol.sh "$RUTA/$PTR_ARCH" "$ESP";
		else
			for ((x = 1; x <= $ESP; x++)); do
				echo -n -e "\xe2\x94\x82   ";
			done
			echo -e "\xe2\x94\x9c\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80"$PTR_ARCH;
		fi
	fi
	PTR_ARCH=$d;
done

if [ ! -z "$PTR_ARCH" ]; then
	if [ -d "$RUTA/$PTR_ARCH" ]; then
		#CARPETA=$(basename $CARPETA);
		./arbol.sh "$RUTA/$PTR_ARCH" "$ESP" "1";
	else
		for ((x = 1; x <= $ESP; x++)); do
			echo -n -e "\xe2\x94\x82   ";
		done
		echo -e "\xe2\x94\x94\xe2\x94\x80\xe2\x94\x80\xe2\x94\x80"$PTR_ARCH;
	fi
fi
