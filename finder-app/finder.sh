#!/bin/bash

#Check arguments

if [ ! $# -eq 2 ] 
then
    echo "ERROR: No se especificaron 2 argumentos"
    exit 1
fi

filesdir="$1"
searchstr="$2"

if [ ! -d "$filesdir" ]
then
    echo "ERROR: $filesdir No existe o no es un directorio"
    exit 1
fi

#Contamos el numero de archivos en el directorio y subdirectorios
num_files=$(find "$filesdir" -type f | wc -l)

#Contamos el numero de lineas coincidentes
num_matches=$(grep -r "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# Imprime el mensaje de salida
echo "The number of files are $num_files and the number of matching lines are $num_matches"

exit 0
