#!/bin/bash

# It's a trap!!!
trap ctrl_c INT;
	
function ctrl_c() {
	# Te dije que era una trampa, MUAHAHAHAHA!
	echo Se presiono ctrl-c >> stdout.txt;
}


############## Ingreso de usuarios #############
echo -e " Hola, le informamos que para hacer uso de este 
 programa necesita ser usuario root en todo momento,sin
 embargo usted puede simular ser cualquier usuario del sistema
 para el ingreso a la SHELL incluido el mismisimo ROOT"

read;
clear;

if [ $(whoami) != "root" ]; then
	echo -e "Lo sentimos, usted no es root";
	exit 1;
fi

echo -e "A continuaciOn puedes ingresar con el usuario que prefieras"

echo -n "Usuario: "
read USUARIO;

echo -n "Contrasenia: "
read -s CONTRA;

./comprobarusuario.sh $USUARIO $CONTRA	# Se inicia el proceso se ingreso y

if [ $? -eq 1 ]; then		# Si el ingreso fallO
	echo "El ingreso ha fallado";
	CONTRA="NO GUARDAR CONTRASENIA";
	exit 1;		#  se sale del programa con el valor FRACASO
else
	echo "	Bienvenido(a) a la linea de comandos de PROTECO";
	echo "	Puedes salir en cualquier momento ingresando \"salir\"";
	echo "";
	CONTRA="NO GUARDAR CONTRASENIA";
fi

################# EjecuciOn de la prompt ##################

prompt=$USUARIO"->"$(pwd)" \xe2\x98\xa2  ";
prompt=$(./ft.sh verdeazul "$prompt");
echo -n -e "$prompt";
read comando;
while [  "$comando" != "salir" ]; do
	claves=$(./seprar.sh "$comando");
	numClaves=-1;

	# SeparaciOn y conteo de claves
	for i in $claves
	do
		let numClaves=$numClaves+1;
		clave[$numClaves]=$i;
		#echo $clave;
	done
	if [ $numClaves -eq -1 ];then numClaves=0; fi
	#echo $numClaves;

	#echo ${clave[$numClaves]};
	#echo ${clave[0]};
	if [ "${clave[0]}" == "arbol" ]; then
		./arbol.sh;
	elif [ "${clave[0]}" == "ayuda" ]; then
		./ayuda.sh
	elif [ "${clave[0]}" == "infosis" ]; then
		./infosis.sh;
	elif [ "${clave[0]}" == "fecha" ]; then
		./fecha.sh;
	elif [ "${clave[0]}" == "hora" ]; then
		./hora.sh;
	elif [ "${clave[0]}" == "buscar" ]; then
		echo Elejiste buscar;
	elif [ "${clave[0]}" == "creditos" ]; then
		echo -e "Prebe shell Realizado por los alumnos:\n";
		./ft.sh amarillo "\xe2\x98\x80" "Martinez Ortiz Saul Axel";
		./ft.sh amarillo "\xe2\x98\x80" "Ferrusca Ortiz Jorge Luis";
	elif [ "${clave[0]}" == "ls" ]; then
		comando=$comando" --color";
		$comando;
	elif [ "${clave[0]}" == "su" ]; then
		echo -e "Ingrese la contraseña"
	elif [ "${clave[0]}" == "color" ]; then
		./$comando;
	else
		$comando;
	fi
	echo -n -e "$prompt";
	read comando;
	prompt=$USUARIO"->"$(pwd)" \xe2\x98\xa2 ";
	prompt=$(./ft.sh verdeazul "$prompt");
done
