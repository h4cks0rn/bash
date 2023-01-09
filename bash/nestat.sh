Sí, se puede escribir un script en Bash que detecte una reverse shell y cierre la conexión. Una forma de hacerlo sería utilizando el comando netstat para verificar si hay algún proceso escuchando en un puerto determinado, y si lo hay, utilizar el comando kill para cerrar la conexión.

El script podría tener una estructura similar a esta:

#!/bin/bash

# Verificar si hay algún proceso escuchando en el puerto 1234
if netstat -ln | grep -q :1234; then
  # Si hay un proceso, obtener su PID
  PID=$(netstat -lnp | grep :1234 | awk '{print $7}' | cut -d '/' -f 1)
  # Terminar el proceso usando el PID
  kill -9 $PID
fi

Este script verifica si hay algún proceso escuchando en el puerto 1234, y si lo hay, obtiene su PID y lo cierra utilizando el comando kill. Puedes modificar el puerto según tus necesidades.
