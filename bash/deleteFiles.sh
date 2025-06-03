#!/bin/bash

# Ruta del directorio que se va a analizar
directorio="/ruta/del/directorio"

# Número de días a partir de los cuales se eliminarán los archivos
dias_limite=7

# Cambia al directorio especificado
cd "$directorio" || exit

# Encuentra y elimina los archivos más antiguos
archivos_eliminados=($(find . -type f -mtime +"$dias_limite"))
find . -type f -mtime +"$dias_limite" -exec rm {} \;

echo "Archivos eliminados correctamente:"
for archivo in "${archivos_eliminados[@]}"; do
  echo "$archivo"
done
