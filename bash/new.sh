#!/bin/bash

# Comprobamos si se ha proporcionado un dominio como parámetro
if [ -z "$1" ]
then
    echo "No se ha proporcionado ningún dominio como parámetro."
    echo "Uso: $0 dominio"
    exit 1
fi

# Ejecutamos dnsrecon a través de torsocks
torsocks dnsrecon -d $1
