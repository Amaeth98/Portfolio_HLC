config_nginx(){
    #Inicia nginx en segundo plano
    #Para lanzar nginx en segundo plano y mantener el contenedor activo,
    #necesitas un proceso en primer plano que evite que Docker
    #finalice el contenedor.
    # Nginx, por defecto, se ejecuta como un demonio (en segundo plano),
    # pero docker requiere un proceso principal activo en el contenedor.
    nginx &
    # Mantener el contenedor activo ejecutando nginx en primer plano
    # exec nginx -g 'daemon off;'
    # Manten el contenedor vivo
    # tail -f /dev/null
}

#.....

load_entrypoint_base() {
    # Ejecutar entrypoint base
    bash /root/admin/base/start.sh
}

main() {
    load_entrypoint_base

    tail -f /dev/null
}