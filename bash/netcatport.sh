# Escanea todos los puertos desde el 1 hasta el 64000

# Variables  
target=$1
port=$2


# Scanning  mode  


function scanning(){
for port in {1..64000}; do
  # Utiliza la utilidad nc para enviar un mensaje al puerto objetivo
  nc -zvw1 $target $port
  # Si el puerto está abierto, imprime un mensaje en pantalla
  if [ $? -eq 0 ]; then
    echo "Puerto $port abierto"
  fi
done
}
