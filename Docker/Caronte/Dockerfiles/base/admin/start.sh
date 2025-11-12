#!/bin/bash
# Carga las variables de entorno pasadas desde el docker-compose.yml
set -e

check-usuario(){
    if grep -q "${USUARIO}" /etc/passwd
    then
        echo "${USUARIO} se encuentra en el sistema." >> /root/logs/informe.log
        return 1
    else
        echo "${USUARIO} no se encuentra en el sistema." >> /root/logs/informe.log
        return 0
    fi
}

check_home(){
    if [ ! -d "/home/${USUARIO}" ]
    then
        echo "El directorio /home/${USUARIO} no existe." >> /root/logs/informe.log
        return 0 #true 0
    else
        echo "El directorio /home/${USUARIO} ya existe." >> /root/logs/informe.log
        return 1 #false 1
    fi
}

newuser (){
    check-usuario
    if [ "$?" -eq 0 ] #No existe el usario.
    then
        check_home
            if [ "$?" -eq  ] #El home no existe.
                useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
                echo "${USUARIO}:${PASSWORD}" | chpasswd
                echo "Bienvenido ${USUARIO} ..." > /home/${USUARIO}/Bienvenido.txt
                echo "Usuario ${USUARIO} creado con exito." >> /root/logs/informe.log
            else
                echo "No se puede crear el usuario ${USUARIO} porque el directorio home ya existe." >> /root/logs/informe.log
            fi
    else
        echo "No se puede crear el usuario ${USUARIO} porque ya existe en el sistema." >> /root/logs/informe.log
    fi
}

main () {
    touch /root/logs/informe.log
    newuser 
    # Encargado de dejar este contenedor vivo en Background.
    tail -f /dev/null
    # Script que se encarga de configurar el imagen/contenedor al iniciarse.
}

main
#Llamada a la funcion main
