#!/bin/bash
set -e

source /root/admin/base/usuarios/mainuser.sh

main () {
    # Gestion usuario --> getuser.sh
    # Gestion del sudo --> getsudo.sh
    # Gestion del SSH --> getssh.sh
    # ... --> get....sh
    touch /root/logs/informe.log
    newuser 
    # Encargado de dejar este contenedor vivo en Background.
    tail -f /dev/null
    # Script que se encarga de configurar el imagen/contenedor al iniciarse.
}

main