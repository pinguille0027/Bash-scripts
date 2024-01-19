#!/bin/bash
if [ $# -ge 1 ] && [ -f "$1" ] && [ -r "$1" ] && [ -w "$1" ]; then
    OPTIONS=(
        "Mostrar las primeras líneas del fichero"
        "Mostrar las últimas líneas del fichero"
        "Mostrar el fichero ordenado alfabéticamente"
        "Mostrar el fichero pantalla a pantalla"
        "Contar el número de líneas del fichero"
        "Contar el número de palabras del fichero"
        "Buscar una palabra en el fichero"
        "Añadir la línea de texto -Fichero de pruebas- al final del fichero"
        salir)
    select opt in "${OPTIONS[@]}"; do
        case $opt in
        "Mostrar las primeras líneas del fichero") head -3 "$1" ;;
        "Mostrar las últimas líneas del fichero") tail -3 "$1" ;;
        "Mostrar el fichero ordenado alfabéticamente") sort "$1" ;;
        "Mostrar el fichero pantalla a pantalla") more "$1" ;;
        "Contar el número de líneas del fichero") wc -l "$1" ;;
        "Contar el número de palabras del fichero") wc -w "$1" ;;
        "Buscar una palabra en el fichero")
            read TERM
            cat "$1" | grep "$TERM"
            ;;
        "Añadir la línea de texto -Fichero de pruebas- al final del fichero") printf "\nfichero de pruebas" >>"$1" ;;
        salir) break ;;
        *) echo "opcion incorrecta" ;;
        esac
    done
else
    echo "se debe pasar la ruta de un fichero como parametro. se deben tener permisos de lectura y escritura sobre el fichero"
fi
