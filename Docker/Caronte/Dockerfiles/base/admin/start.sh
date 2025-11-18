#!/bin/bash
# Carga las variables de entorno pasadas desde el docker-compose.yml

source /home/adri/admin/base/usuarios/mainuser.sh
source /home/adri/admin/base/ssh/mainssh.sh

#source /root/admin/base/usuarios/mainUsuariosPostgress

main () {
    # Gestion usuario --> getuser.sh
    # Gestion del sudo --> getsudo.sh
    # Gestion del SSH --> getssh.sh
    # ... --> get....sh
    touch /root/logs/informe.log
    newuser 
    if [ "$?" -eq 0 ]
    then;
       configurar_ssh
    fi
    
    # Encargado de dejar este contenedor vivo en Background.
    tail -f /dev/null
    # Script que se encarga de configurar el imagen/contenedor al iniciarse.
}

main