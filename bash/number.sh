#!/bin/bash


max_number=0  

echo "================================================================"
for((i=0; i <= 4;  i++)); do  
    echo -ne   "Enter  the  number: " &&  read  num
    if [ $num -gt $max_number ]; then 
         max_number=$num 
    fi
done 

echo   "[+] Number mayor: $max_number"

echo "================================================================"

 


