#!/bin/bash

declare  -r   main_url=$1
# Obtener el contenido de la página web
contenido=$(curl -s $main_url)

# Buscar y extraer las etiquetas meta que contienen las palabras "technology" o "technologies"
tecnologias=$(echo "$contenido" | grep -oP '(?<=<meta).*?(?=\/>)')

# Imprimir las tecnologías encontradas
echo "$tecnologias"
