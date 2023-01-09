#!/bin/bash

# Author: th3hostname -  IRVING ST   - nmap y pa' dentro

# colorize the output
color1='\033[0;31m' # Red
color2='\033[0;33m' # Orange
color3='\033[0;32m' # Yellow
color4='\033[0;36m' # Green
color5='\033[0;34m' # Blue
color6='\033[0;35m' # Purple
color7='\033[0;95m' # Pink
color8='\033[0;30m' # Brown
color9='\033[0;37m' # Gray
color10='\033[0;90m' # Black
color11='\033[0;97m' # White
color12='\033[0;92m' # Light green
color13='\033[0;32m' # Dark green
color14='\033[0;96m' # Light blue
color15='\033[0;94m' # Dark blue
color16='\033[0;93m' # Light pink
color17='\033[0;91m' # Dark pink
color18='\033[0;33m' # Light orange
color19='\033[0;31m' # Dark orange
color20='\033[0;93m' # Light yellow
color21='\033[0;33m' # Dark yellow
color22='\033[0;91m' # Light red
color23='\033[0;31m' # Dark red
color24='\033[0;90m' # Light brown
color25='\033[0;30m' # Dark brown
color26='\033[0;37m' # Light gray
color27='\033[0;90m' # Dark gray
color28='\033[0;35m' # Purple
color29='\033[0;36m' # Turquoise
color30='\033[0;92m' # Lime
endColour="\033[0m\e[0m"


trap  ctrl_c  INT  #  trap  ctrl_c  to  interrupt

function  ctrl_c() { #  function  to execute ctrl_c
    printf "\033c" #  clear  the terminal 033c  
    printf "Exiting...\n"
    exit  1;  tput  cnorm  # exit the  program 
}

# Functions  to execute
function helpPanel(){
   printf "\n\t${color7} Author${endColour}${color11}:${endColour}${color3} th3hostname ${color11}-${endColour}${color3} IRVING ST${endColour}${color11}.${endColour}\n"
   printf "\t\t${color11}-u${endColour}${color12})${endColour}${color3} https://example.com ${endColour}\n"
   printf "\t\t${color11}-t${endColour}${color12})${endColour}${color3}  $0 -u  https://example.com  -t  20${endColour}\n"
   printf "\t\t${color11}-h${endColour}${color12})${endColour}${color3} helpPanel${endColour}\n"
   printf "\t\t\t${color15}usage${endColour}${color11}:${endColour}${color11}  $0 -u  https://example.com  -t  20${endColour}\n"

} # <- function to execute help panel 

function  fuzz_mode(){
    if [[ "$(echo $fuzz )" ==  "httfuzz"  ]];then
          httrack "${url}" -O temp -%v | grep -E 'HREF=".*"' | sed -e 's/^.*HREF="//' -e 's/".*$//' | awk '!x[$0]++' | sort | uniq | xargs httrack -O temp -%v
          httrack "${url}" -O temp -%v | awk '/HREF/ {print $2}' | sed -e 's/"//g' -e 's/^.*"//' | grep -v '^[A-Za-z0-9]*\.\(css\|js\|png\|gif\|jpg\|jpeg\)$' | sort | uniq | xargs httrack -O temp -%v
   
    elif [[ "$(echo  $fuzz)" == "curlfuzz" ]];then
          while read line; do
             curl -s -o /dev/null -w "%{http_code}" "${url}/$line"
          done <  /usr/share/wordlists/dirbuster/directory-list-lowercase-2.3-medium.txt
    else  
         : #  pass 
    fi 
} #  function  to exucute  fuzzing 

#  main  arguments 
declare -i parameter_counter=0; while getopts ":u:t:h:" args; do
     case ${args} in
         u) url=$OPTARG;  let parameter_counter+=1;;
         t) time=$OPTARG; let parameter_counter+=1;; 
         f) fuzz=$OPTARG; let  parameter_counter+=1;;  
         h) helpPanel;;
         *) : ;;
     esac
done

if [[ $parameter_counter -ne  3 ]];then  # check  if  parameter_counter  is correct igualment two parameters passed in the script.
    helpPanel
else
    fuzz_mode  
fi 