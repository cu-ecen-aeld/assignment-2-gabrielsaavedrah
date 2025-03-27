#!/bin/bash

#Check arguments

if [ ! $# -eq 2 ] 
then
    echo "ERROR: No se especificaron 2 argumentos"
    exit 1
fi

writefile="$1"
writestr="$2"

dirname=$(dirname "$writefile")

if [ ! -d "$dirname" ]; then
	mkdir -p "$dirname" || { echo "Error: No se pudo crear el directorio $dirname"; exit 1; }
fi

#escribir el contenido en el archvo
echo "$writestr" > "$writefile" || { echo "Error: No se pudo crear el archivo $writefile"; exit 1; }

echo "Archivo creado correctamente: $writefile"
