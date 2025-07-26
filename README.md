ATUALIZADOR_DE_SISTEMA_COM_BASH
para rodar ele altomaticamente eu recomendo que faça isso:

de permição de execulção: 
chmod +x /home/seu_usuario/atualizar_sistema.sh

chmod = change mode, altera permição de arquivo
+x = adiciona eXeculção.

execulte o crontsb como root:
sudo crontab -e

após isso escolha o editor de texto de sua preferencia, se vc for iniciante use o NANO, ele é o mais simples.

coloque a hora de execulção:
no arquivo adicione isso: 0 3 * * * /diretorio_do_arquivo/arquivo.sh
para saber o entereço entre no diretorio do código e execulte o comando "pwd".
isso faz com que o código seja execultado diariamente as 3 da manha.
após isso saia:

verifique o agendamento:
sudo crontab -l
se apareceder ao final o comando adicionado está funcionando.
