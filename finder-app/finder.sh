#!/bin/bash

# 1) Comprobar argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 <directorio> <cadena-a-buscar>"
  exit 1
fi

# 2) Asignar variables
filesdir="$1"
searchstr="$2"

# 3) Validar directorio
if [ ! -d "$filesdir" ]; then
  echo "Error: '$filesdir' no es un directorio válido."
  exit 1
fi

# 4) Contar archivos
num_files=$(find "$filesdir" -type f | wc -l)

# 5) Contar líneas que contienen la cadena
num_matches=$(grep -R "$searchstr" "$filesdir" 2>/dev/null | wc -l)

# 6) Imprimir resultado
echo "The number of files are $num_files and the number of matching lines are $num_matches"
exit 0

