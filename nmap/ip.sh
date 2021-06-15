#!/bin/env bash

cc=$1
if [[ $cc != "" ]];then
	nmap -n -sP 192.168.1.1/24 -oX ip.xml 
fi

echo "ip list"
cat ip.xml | grep 'address addr=' | grep -v 'mac' | awk '{print $2}'

echo "ip count"
cat ip.xml | grep 'address addr=' | grep -v 'mac' | awk '{print $2}' | wc -l
