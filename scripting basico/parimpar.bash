#!/bin/bash

NUMBER=$(($1 % 2))

if [ $NUMBER -eq 0 ]; then
    echo "par"
else
    echo "impar"
fi
