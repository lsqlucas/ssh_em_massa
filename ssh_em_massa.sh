#!/bin/bash
# -------------------------------------------------------------------------------------------------- #
#  Esse roteiro executa os comandos do arquivo comandos-ssh em massa nas maquinas que
#  estiverem com o ip listado no arquivo ips
# -------------------------------------------------------------------------------------------------- #

#==VARIÁVEIS=========================================================================================#
#Lê o arquivo de ips
ips=$(cat /srv/ips)
#Cria um array com a lista de ip's
array_ips=($ips)
#Exporta a data atual para a variavel data
export data=`date +%Y%m%d`
#Caminho do arquivo de logs
caminho="/srv/logs/log-$data.log"
#mensagem exibida
mensagem='realizado a atualização da maquina = '
#Resposta positiva
positivo='Foi '
#Resposta negativa
negativo='Não foi '

#===================================================================================================#

#==EXECUÇÃO=========================================================================================#
echo "================================VERIFICAÇÃO-" $data "===================================" >> $caminho
echo "" >> $caminho
echo "COMANDOS REALIZADOS" >> $caminho
echo "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨" >> $caminho
echo "$(cat /srv/comandos)" >> $caminho
echo "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨" >> $caminho
echo "" >> $caminho

echo "" >> $caminho
echo "IPS QUE SERÃO VERIFICADOS" >> $caminho
echo "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨" >> $caminho
echo $ips >> $caminho
echo "¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨¨" >> $caminho
echo "" >> $caminho
echo "" >> $caminho


for ip in ${array_ips[@]}
do
        echo "Iniciando verificação da maquina: $ip às $(date +%T)" 
        echo "INICIANDO PROCEDIMENTO: $ip às $(date +%T)" >> $caminho
        echo "" >> $caminho
        echo "RESULTADO" >> $caminho
        echo "----------------------" >> $caminho
        sshpass ssh -o StrictHostKeyChecking=no -o PreferredAuthentications=publickey  -i ~/.ssh/id_rsa root@$ip "$(cat /srv/comandos)" >> $caminho
        echo "----------------------" >> $caminho
                if [ $? -eq 0 ]
                then
                echo $positivo $mensagem $ip >> $caminho
                else
                echo $negativo $mensagem $ip >> $caminho
                fi
        echo "" >> $caminho
        echo "ENCERANDO PROCEDIMENTO: $ip às $(date +%T)" >>$caminho
        echo "____________________________________________________________________________________________" >> $caminho
done
echo "=============================================================================================" >> $caminho
echo "" >> $caminho
echo "" >> $caminho
echo "" >> $caminho
echo "" >> $caminho
echo "" >> $caminho
