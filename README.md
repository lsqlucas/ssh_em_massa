# ssh_em_massa
Esse script executa múltiplos comandos em múltiplos IP's de forma sequencial, obedecendo uma sequencia pre definida nos arquivos "comandos" e "ips". A autenticação do server que executa esse script para com o cliente ocorre via SSH por meio de um par de chaves RSA.

### Caminho
O script "ssh_em_massa" esta pre configurado para abrir os arquivos dentro do caminho "/srv/", no entanto pode ser alterado conforme a necessidade.

### Comandos
O arquivo "comandos" deve ser alterado com base no comando que deseja realizar no host remoto. Assimile esse arquivo como sendo um terminal no host remoto.

### IP's
O arquico "ips" deve ser alterado com base no cenario, lembrando que o host remoto precisa ter comunicação com o server que executa esse script, e tambem precisa ter a chave RSA ja configurada. ver [Configurando chaves RSA](https://servidordebian.org/pt/buster/config/remote_access/ssh_server_passwordless)

### Logs
O roteiro foi feito para trazer uma serie de informações, contendo: 
- Comando executado
- IPs da lista
- Data e Hora de inicio e fim do procedimento

Alem de trazer a resposta de cada comando no log a cada vez que verifica um determinado ip 

![](https://github.com/lsqlucas/ssh_em_massa/blob/c77d566f46a7a7669000d3ab77bb49d5100fc05f/Resultado.png)

### Requisitos
Crie a pasta para armazenar os logs

`mkdir logs`

Instale o ssppass

`apt-get update`

`apt-get sshpass`
