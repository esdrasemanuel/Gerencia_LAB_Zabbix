#!/bin/bash

subrede=$1
user=$2
senha=$3

if [ -z $subrede ] || [ -z $user ] || [ -z $senha ]; then
echo "Modo de executar: [ ./script subrede. usuario senha ]  ---- ~$ ./install_agents.sh 192.168.1. aluno aluno"
exit 0
fi

for IP in `seq 0 1 255 `; do
   #echo $subrede$IP
   ping -c 3 -t 5 $subrede$IP > /dev/null && sshpass -p "$senha" ssh -o StrictHostKeyChecking=no $user@$subrede$IP "wget http://repo.zabbix.com/zabbix/3.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.2-1+xenial_all.deb ; echo 'aluno' | sudo -S -u root sh -c 'sudo dpkg -i zabbix-release_3.2-1+xenial_all.deb' ; echo 'aluno' | sudo -S -u root sh -c 'sudo apt-get update' ; echo 'aluno' | sudo -S -u root sh -c 'sudo apt-get install -y zabbix-agent' ; echo 'aluno' | sudo -S -u root sh -c 'openssl rand -hex 32 >> /etc/zabbix/zabbix_agentd.psk' ; echo 'aluno' | sudo -S -u root sh -c 'sed -i 's/Server=127.0.0.1/Server=20.20.1.111/' /etc/zabbix/zabbix_agentd.conf' ; echo 'aluno' | sudo -S -u root sh -c 'sed -i -e 's/#[[:blank:]]EnableRemoteCommands=0/EnableRemoteCommands=1/' /etc/zabbix/zabbix_agentd.conf' ; echo 'aluno' | sudo -S -u root  sh -c 'echo zabbix ALL=NOPASSWD: ALL >> /etc/sudoers' " &
done

#OBS
#Nos comando executados dentro do ssh deve-se colocar a senha de root para determinados comando. 
#Basta substituir por ex: [ echo 'aluno'  | sudo .... ] , onde 'aluno' é a senha a ser jogada no sudo 
