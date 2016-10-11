#!/bin/bash

# FunciOn: Imprimir una cadena a color
# Argumentos: Nombe del color
#echo $1
#echo $2
#echo $3

if [ $# -lt 2 ]; then
	exit 1;
fi

if [ "$2" == "-l" ]; then
	a="$3";
	echo -e "Lista de colores (minuscula para claro y mayuscula oscuro):
		negro -- Negro
		rojo -- Rojo
		verde -- Verde
		amarillo -- Amarillo
		azul -- Azul
		magenta -- Magenta -->> Usame D:
		verdeazul -- Verdeazul
		gris -- Gris
		blanco (Espero que no quieras conocer el blanco fuerte
			por que no hay)
		"
else
	a="$2";
fi


if [ $1 == "negro" ]; then
	echo -e "\e[30m"$a"\e[0m";
elif [ "$1" == "Rojo" ]; then
	echo -e "\e[31m"$a"\e[0m";
elif [ "$1" == "Verde" ]; then
	echo -e "\e[32m"$a"\e[0m";
elif [ "$1" == "Amarillo" ]; then
	echo -e "\e[33m"$a"\e[0m";
elif [ "$1" == "Azul" ]; then
	echo -e "\e[34m"$a"\e[0m";
elif [ "$1" == "Magenta" ]; then
	echo -e "\e[35m"$a"\e[0m";
elif [ "$1" == "Verdeazul" ]; then
	echo -e "\e[36m"$a"\e[0m";
elif [ "$1" == "gris" ]; then
	echo -e "\e[37m"$a"\e[0m";
elif [ "$1" == "Gris" ]; then
	echo -e "\e[90m"$a"\e[0m";
elif [ "$1" == "rojo" ]; then
	echo -e "\e[91m"$a"\e[0m";
elif [ "$1" == "verde" ]; then
	echo -e "\e[92m"$a"\e[0m";
elif [ "$1" == "amarillo" ]; then
	echo -e "\e[93m"$a"\e[0m";
elif [ "$1" == "azul" ]; then
	echo -e "\e[94m"$a"\e[0m";
elif [ "$1" == "magenta" ]; then
	echo -e "\e[95m"$a"\e[0m";
elif [ "$1" == "verdeazul" ]; then
	echo -e "\e[96m"$a"\e[0m";
elif [ "$1" == "blanco" ]; then
	echo -e "\e[37m"$a"\e[0m";
fi
