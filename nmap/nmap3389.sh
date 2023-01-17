#!/bin/bash

nmap -sP 192.168.1.1/24 -oG ip.xml > /dev/null
cat ip.xml | grep 192 | awk '{print $2}'  > ip.txt

lst=$(cat ip.txt)


for i in ${lst[@]}; do
    val=${#i}
    if [[ $val -gt 5 ]];then
        ret=$(nmap -p 3389 $i | grep open)
        if [[ $ret != "" ]];then
            echo $i
        fi
    fi
done
