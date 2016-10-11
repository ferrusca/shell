#!/bin/bash

# Script que ejecuta la prebeplayer

./ft.sh -s "\t\t ¡¡Bienvenido a la prebeplayer !!\n\n";

./ft.sh " Seleccione la opción deseada: ";

op1="Reproduce la carpeta actual";
op2="Subir una carpeta";
op3="Cambiar de carpeta";
op4="Lista archivos y subcarpetas de la carpeta actual";
op5="Opciones del reproductor";
op6="Salir";

salida=1

while [ $salida -eq 1 ]; do
	select AUTOS in  "$op1" "$op2" "$op3" "$op4" "$op5" "$op6" 
	do
		case $AUTOS in	
			"$op1")
				echo "Ferrari Tsuru"
				read;
				break
				;;
			"$op2")
				echo hola.
				break
				read;
				;;
			"$op3")
				echo "Mercedes Benz"
				read;
				break
				;;
			"$op4")
				ls --color *.mp3 -d */;
				read;
				break
				;;
			"$op5")
				echo ""
				read;
				break
				;;
			"$op6")
				salida=0;
				read;
				break
				;;
		esac
	done

done
