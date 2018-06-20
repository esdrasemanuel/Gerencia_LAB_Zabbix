# Gerencia de Redes de Computadores
## Universidade Federal do Ceará - Campus Quixadá

## Monitorização do laboratório de informática da Escola de Ensino Médio Professora Maria Edilce Dias Fernandes - Ibicuitinga


Antonio Matheus Cavalcante da Silva <br>
Esdras Emanuel Mariano Moreira

## Objetivo
Fazer o Gerênciamento de um laboratório de informática utilizando a ferramenta de monitoramento ZABBIX. Este trabalho, monitorou 13 hosts do laboratorio escolar de informática da escola Maria Edilce Dias Fernandes, realizamos um script de desligamento automático das máquinas no fim do horário letivo, assim facilitando o trabalho do gerente e poupando recursos.

## Cenário

#### Topologia:
13 computadores funcionando

<div align="center"><img src="img/topologia.png" alt="" style="width:80; height:85px;"/></div>
<div align="center"><img src="img/gerencia06.png" alt="" style="width:80; height:85px;"/></div>

#### Sistema:
Ubuntu 16.04 

#### Funcionamento do laboratorio: 
07h às 11h e de 13h as 17h

## Ferramenta
```
ZABBIX - Versão 3.2.11
```
## Servidor


## Instalação dos Agentes
**pré-requisitos**
- sshpass

Foi feito um script para a instalação automatizada do agent zabbix em todos os hosts do laboratório. Usamos conexão via ssh para entrar em cada máquina, executar os comando e adicionar as configurações no arquivo zabbiz_agentd.conf.
O script pinga em todos os ips de um determinada rede que é colocada como parâmetro no momento da execução, em seguida os hosts que foram pigados seram tentado o acesso via ssh para ser executados os comando de instalaçao e configuração. <br>
**Modo de executar:**
```
./install_agents.sh subrede. usuario senha
./install_agents.sh 20.20.1. aluno aluno
```

## Configuração do ambiente no Zabbix

Foi criado um grupo chamado LEI (Laborario Escolar de Informatica) para adicionar os host no mesmo.
<div align="center"><img src="img/gerencia06.png" alt="" style="width:80; height:85px;"/></div>

Em cada host, adicionamos o template ( Template OS Linux )
<div align="center"><img src="img/gerencia07.png" alt="" style="width:80; height:85px;"/></div>

Todos os Hosts Adicionados 
<div align="center"><img src="img/gerencia08.png" alt="" style="width:80; height:85px;"/></div>

## trigger

<div align="center"><img src="img/gerencia09.png" alt="" style="width:80; height:85px;"/></div>

```
{Template OS Linux:agent.ping.time()}>110000 and {Template OS Linux:agent.ping.time()}<130000 or {Template OS Linux:agent.ping.time()}>170000 and {Template OS Linux:agent.ping.time()}<180000
```
## Acão

<div align="center"><img src="img/gerencia04.png" alt="" style="width:80; height:85px;"/></div>

## Operações
<div align="center"><img src="img/gerencia05.png" alt="" style="width:80; height:85px;"/></div>

```
sudo shutdown -h 1 "Fim do horário letivo, desligando em 1 minuto."
```
