#!/bin/bash
set -e

configurar_ssh() {

    #Deshabilitar login de root por ssh
    sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

    #Cambiar el puerto ssh
    sed -i 's/#Port.*/Port '$PORT_SSH'/' /etc/ssh/sshd_config

    #Reiniciar el servicio ssh
    service ssh restart

    mkdir -p /home/${USUARIO}/.ssh
    #cp /root/admin/base/common/id_ed25519.pub /home/${USUARIO}/.ssh/authorized_keys
    cat /root/admin/base/common/id_rsa.pub >> /home/${USUARIO}/.ssh/authorized_keys
}
# /etc/init.d/ssh start &
# exec /usr/sbin/sshd -D & (dejar el ssh en background; segundo plano)

#adri ALL=(ALL:ALL) ALL
config_sudoers() {
    if [ -f /etc/sudoers ]
    then
        #comprobar que el ${USUARIO} No existe
        echo "${USUARIO} ALL=(ALL:ALL) ALL" >> /etc/sudoers
    fi
}