
#!/bin/bash
check_usuario(){
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
    check_usuario
    if [ "$?" -eq 0 ] #No existe el usario.
    then
        check_home
            if [ "$?" -eq 0 ] #El home no existe.
            then
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
