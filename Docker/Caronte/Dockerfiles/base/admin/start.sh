#!bin/bash

newUser(){
    useradd -rm -d /home/${USUARIO} -s /bin/bash ${USUARIO}
    echo "${USUARIO}:1234" | chpasswd
    echo "Bienvenida ${USUARIO} a tu empresa..." > /home/${USUARIO}/bienvenida.txt
}

main (){
    newUser
    #llamada a la funcion newUser
    # Encargada de dejar este contenedor vivo en BGround
    tail -f /dev/null
    # Script que se encarga de configurar la imgen/contenedor
}

main 
# llamada a la funcion "main"