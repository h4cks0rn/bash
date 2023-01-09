#!/bin/bash  


url=$1 

while read line; do
  httrack "$url/$line" -O temp -%v > /dev/null 2>&1
done <  /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt 
