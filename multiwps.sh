#!/bin/bash
# archivo d salida unico
output_file="wpscan_results.txt"

# limpiar el archivo de salida si ya exite (opcional)
> "$output_file"

# leer cada URL del archivo de texto y correr el WPScan
while IFS= read -r url
do
  echo "Escaneando $url" >> "$output_file"  # Escribir la url q se esta escaneando en el archivo
  # Correr WPScan y mandar todo, tanto la salida como los errores, al archivo
  wpscan --url "$url" >> "$output_file" 2>&1
  echo "----------------------------------------" >> "$output_file"  
done < urls.txt

