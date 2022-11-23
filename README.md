# KPLZ
Termina processos pelo nome do comando. Não termina o processo do script ou o processo pai. Se o processo continua vivo após o envio do SIGTERM, envia um SIGKILL para encerrá-lo.
## Requerimentos
Clonar o repositório ou baixar o script, habilitando a execução com `chmod +x bake.sh`. Para executar como um comando do shell, `mv kplz.sh bake; mv kplz $HOME/.local/bin` (ou `$HOME/.bin`, ou o diretório de scripts do usuário).
## Uso
```sh
$ kplz [nome do processo]
```
