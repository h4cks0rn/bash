#!/bin/bash

# Dibuja la forma del corazón utilizando símbolos de la línea de comandos
for i in {0..4}
do
  for j in {0..4}
  do
    if [ $i -eq 0 ] && [ $j -eq 2 ]
    then
      printf "   \u2665   "
    elif [ $i -eq 1 ] && ([ $j -eq 1 ] || [ $j -eq 3 ])
    then
      printf " \u2665     \u2665 "
    elif [ $i -eq 2 ] && ([ $j -eq 0 ] || [ $j -eq 4 ])
    then
      printf "\u2665       \u2665"
    elif [ $i -eq 3 ] && ([ $j -eq 1 ] || [ $j -eq 3 ])
    then
      printf " \u2665     \u2665 "
    elif [ $i -eq 4 ] && [ $j -eq 2 ]
    then
      printf "   \u2665   "
    else
      printf "       "
    fi
  done
  printf "\n"
done
