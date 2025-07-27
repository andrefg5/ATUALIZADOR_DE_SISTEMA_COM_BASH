# ATUALIZADOR_DE_SISTEMA_COM_BASH

Para rodar ele automaticamente, recomendo que siga os passos abaixo:

---

###  1. Dê permissão de execução ao script:

```bash
chmod +x /home/seu_usuario/atualizar_sistema.sh
```

> `chmod` = *change mode*, altera permissões de arquivos  
> `+x` = adiciona permissão de e**x**ecução

---

###  2. Agende o script no **crontab como root**:

```bash
sudo crontab -e
```

Escolha o editor de texto da sua preferência. Se for iniciante, escolha o **nano** (mais simples).

---

###  3. Adicione a linha abaixo no final do arquivo para agendar a execução diária às 3 da manhã:

```bash
0 3 * * * /diretorio_do_arquivo/arquivo.sh
```

> Para saber o caminho completo (`/diretorio_do_arquivo/arquivo.sh`), entre no diretório do script e use o comando abaixo para descobrir:

```bash
pwd
```

---

###  4. Verifique se o agendamento foi salvo corretamente:

```bash
sudo crontab -l
```

Se a linha que você adicionou aparecer, está funcionando corretamente.

---

###  5. Permitir que certos comandos rodem **sem pedir senha**, para o processo ser totalmente automático:

Abra o arquivo seguro do `sudo`:

```bash
sudo visudo
```

No final do arquivo, adicione a seguinte linha (substitua `seu_usuario` pelo seu nome de usuário real):

```bash
seu_usuario ALL=(ALL) NOPASSWD: /usr/bin/apt, /usr/bin/apt-get, /usr/bin/snap refresh
```

---

Após isso, tudo estará pronto para funcionar automaticamente sem intervenção manual. 
