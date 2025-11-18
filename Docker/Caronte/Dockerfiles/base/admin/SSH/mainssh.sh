#!/bin/bash

configurar_ssh() {

    #Deshabilitar login de root por ssh
    sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

    #Cambiar el puerto ssh
    sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config

    #Configurar la autenticacion por clave publica
    mkdir -p /var/run/sshd
    ssh-keygen -A

    #Reiniciar el servicio ssh
    service ssh restart

}