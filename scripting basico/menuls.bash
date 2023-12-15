#!/bin/bash
OPTIONS=(simple largo completo salir)
select opt in "${OPTIONS[@]}"; do
    case $opt in
    simple) ls ;;
    largo) ls -l ;;
    completo) ls -la ;;
    salir) break ;;
    *) echo "opcion incorrecta"
    esac
done
