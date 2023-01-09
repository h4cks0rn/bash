#!/bin/bash

# Comprobamos si se ha proporcionado un dominio como parámetro
if [ -z "$1" ]
then
    echo "No se ha proporcionado ningún dominio como parámetro."
    echo "Uso: $0 dominio"
    exit 1
fi

# Instalamos nmap si no está instalado
if ! [ -x "$(command -v nmap)" ]
then
    sudo apt-get update
    sudo apt-get install nmap
fi

# Realizamos el escaneo
nmap -sS $1
