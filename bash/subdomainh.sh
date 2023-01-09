#!/bin/bash
domain=$1


curl --silent  GET   "https://crt.sh/?q=%.google.com"  | grep  google.com |sed -e 's/<TD>/\n/g' |  sed -e 's/<\/TD>//g' | sed  's/<BR>/\n/g'  |  sed  's/*.//g'





