#!/bin/bash

# 1) Comprobar argumentos
if [ $# -ne 2 ]; then
  echo "Uso: $0 <ruta-completa-al-fichero> <cadena-a-escribir>"
  exit 1
fi

# 2) Asignar variables
writefile="$1"
writestr="$2"

# 3) Crear ruta si no existe
dirpath=$(dirname "$writefile")
mkdir -p "$dirpath"

# 4) Escribir al fichero (sobrescribe o crea)
if ! echo "$writestr" > "$writefile"; then
  echo "Error: no se pudo crear o escribir en '$writefile'."
  exit 1
fi

# 5) Éxito
exit 0

