#!/bin/bash  

cut -d: -f1,3 /etc/passwd | awk '{ printf "%-8s  %-6s\n", $1, $2 }'  
