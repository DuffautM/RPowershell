#! /bin/bash

compt = 0
file = "/etc/Rattrapage/test.txt"

nom = $(grep "Nom d\'hôte" file | cut -d":" -f2)
ip = $(grep "IP" file | cut -d":" - f2)
passerelle = $(grep "Passerelle" file | cut -d":" -f2)
services = $(grep "Services" file |cut -d":" -f2)



#sh ./script_dns.sh $p1
#sh ./script_dhcp.sh $p2
