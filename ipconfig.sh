#!/bin/bash
clear
echo "Escolha uma opção:"
echo
echo "1) Configurar rede com IP fixo"
echo "2) Configurar rede com DHCP"
echo "3) Sair"
echo
echo -n " Escolha uma opçao:"
read op

case $op in

	1)
		echo "Configuraçao manual da rede"
		sleep 2s
		echo -n "Informe o nome do host :" 
		read hostname
		echo -n "Informe o nome do dominio"
		read domain
		echo  -n "Informe o IP do host:"
		read ip
		echo -n "Informe a mascara:"
		read mask
		echo -n "Informe o gateway:"
		read gateway gw
		echo -n "Informe o DNS:"
		read dns
		echo
		echo "Configurando arquivo 1"
		echo "networking=yes" > /etc/sysconfig/network
		echo "hostname=\"$hostname.$domain\" " >> /etc/sysconfig/network 
		echo "gateway=$gw">> /etc/sysconfig/network
		echo "gateway=eth0">> /etc/sysconfig/network
		sleep 2s
		echo "Configurando arquivo 2"
		echo "DEVICE=\"eth0\" "> /etc/sysconfig/network-scripts/ifcg-eth0
		echo " ONBOOT=\"yes\" ">> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "IPADDR=\"$ip\" ">> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "NETMASK=\"$mask\" ">> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "HOSTNAME=$hostname">> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "DOMAIN=$domain">> /etc/sysconfig/network-scripts/ifcg-eth0
		sleep 2s
		echo "Configurando arquivo 3"
		echo "namesewer $dns" > /etc/resolv.conf
		sleep 2s
		echo "Configurando arquivo 4"
		echo "127.0.0.1 localhost.localdomain localhost"> /etc/hosts
		echo "$ip $hostname.$domain $hostname">> /etc/hosts
		echo
		echo "FEITO"
		sleep 2s
		service network restart
		;;
	2)
		echo "Ajustando rede por DHCP"
		sleep 3s
		echo "DEVICE=\"eth0\""> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "ONBOOT=\"yes\" ">> /etc/sysconfig/network-scripts/ifcg-eth0
		echo "BOOTPROTO=\"DHCP\" ">> /etc/sysconfig/network-scripts/ifcg-eth0
		service network restart
		;;

	3)
		echo "Deseja realmente sair (s/n)?"
		read escolha

		if [ $escolha=s -o $escolha=S ]; then
			sleep 1s
			exit
		else
			./confrede.sh
		fi
		;;

	*)
		echo "Opçao invalida!!"
		sleep 2
		./confrede.sh
		;;
	esac
