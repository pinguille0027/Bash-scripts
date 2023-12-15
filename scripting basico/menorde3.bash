#!/bin/bash
if [ $1 -lt $2 ] && [ $1 -lt $3 ]; then
    echo "$1 es el menor de los 3"
    elif [ $2 -lt $1 ] && [ $2 -lt $3 ] ; then
    echo "$2 es el menor de los 3"
    else
    echo "$3 es el menor de los 3"
fi