#!/bin/bash
# Autor: André Farinelli Gonzales
# Não uso o "set -e" por conta disso: https://mywiki.wooledge.org/BashFAQ/105

#ESTE CÓDIGO FOI FEITO PARA DITRIBUIÇÕES COM BASE DEBIAN

# Este código foi feito para um fim muito específico: atualizar o sistema automaticamente
# usando o "cron", agendador de tarefas. Mas acabei reparando que muitos iniciantes têm
# dificuldade em manter o sistema atualizado. Então, para permitir que os poucos amigos
# que consegui trazer para o lado pinguim da força possam aprender com este código,
# estou postando no GitHub.

#se ocorrer erro execulte, se não não execulte.
if ! sudo apt update -y; then # Atualiza a lista de pacotes. Explicação do comando: "sudo" (superusuário executa),
  echo "erro" #imprime.       # chama "apt" (ferramenta de empacotamento avançada) para atualizar os pacotes essenciais.
  exit 1  #retorna erro.      # O parâmetro "-y" responde "sim" automaticamente a todas as confirmações.
fi #fim do "if.

#mesma lógica.
if ! sudo apt upgrade -y; then # Atualiza os pacotes instalados, seguindo a mesma lógica anterior.
  echo "erro" #mesma lógica.
  exit 1 #mesma lógica.
fi #mesma lógica.

if ! sudo apt dist-upgrade -y; then # Atualiza os pacotes da distribuição, podendo instalar ou remover pacotes se necessário.
  echo "erro"
  exit 1
fi

if ! sudo apt autoremove -y; then # Remove pacotes não utilizados, liberando espaço.
  echo "erro"
  exit 1
fi

if ! sudo apt autoclean -y; then # Remove arquivos de pacotes antigos que não são mais necessários.
  echo "erro"
  exit 1
fi

if ! sudo apt clean -y; then # Limpa o cache de pacotes baixados.
  echo "erro"
  exit 1
fi

if ! sudo apt --fix-broken install -y; then # Corrige eventuais problemas de dependência ou pacotes quebrados.
  echo "erro"
  exit 1
fi

if command -v flatpak &>/dev/null; then #se flatoak instalado, atualise, se não estiver nada é execultado.
    flatpak update -y                   #o "command -v" faz a verificação.
fi #fim do "if".

if command -v snap &>/dev/null; then #se "snap" instalado, atualise, se não estiver nada é execultado.
    sudo snap refresh
fi #fim do "if".
