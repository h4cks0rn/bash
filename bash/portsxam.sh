#!/bin/bash 


trap  ctrl_c  INT  




function ctrl_c(){




}



function  helpPanel(){




}


function detection_ports(){ 

  for ((i=0;i<=64000;i++));do

  echo  ' ' >  /dev/tcp/${ip_addres}/$i  >  /dev/null 2>&1
  if  [[ "$(echo  $?)" ==  "0"]]; then
        echo  "[+]"


  fi 

  done  
}



if  [ "$(id -u)" ==  "0" ];then parameter_counter=0; while getopts  args ":h:l:t:";do 
         case $args  in
             h) helpPanel;;
             l) ip_addres;  let parameter_counter+=1 ;; 
             t) detection_ports;  let  parameter_counter+=1 ;;
          esac 
      done  
else
   echo  "[+]  No root" 
fi 


#  portsxam -l 192.169..1.1 -t tcp