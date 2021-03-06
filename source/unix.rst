=========================
Comandos do Console Linux
=========================

    Cada um destes comandos possui uma vasta gama de opções e
    variações. Para obter maiores detalhes sobre qualquer um deles,
    basta digitar o seguinte comando no console: 'man comando' e a
    documentação do comando aparecerá instantaneamente. Para retornar
    ao console tecle 'q'.

    Seguindo a filosofia do Unix onde cada programa deve fazer apenas
    uma coisa bem, estes comandos podem e devem ser combinados para
    tarefas mais complexas. Nós Criamos uma [área de dicas] aberta, Na
    qual qualquer um pode adicionar suas próprias receitas de
    utilização destes (e outros) comandos.

Arquivos e diretórios:
---------------------

    * ls
        Lista arquivos.
    * cp
        Copia arquivos.
    * mv
        Renomeia ou move arquivos.

    * rm
        Apaga arquivos (de verdade!).

    * ln
        Cria links para arquivos.

    * pwd
        Imprime o nome do diretório corrente (caminho completo).

    * mkdir
        Cria um diretório.

    * rmdir
        Remove um diretório. Para remover recursivamente toda uma arvore de diretórios use ``rm -rf`` (cuidado!).


Visualização de arquivos:
-------------------------

    * cat
        Joga o arquivo inteiro na tela.

    * less
        Visualiza o arquivo com possibilidade de movimentação e
    busca dentro do mesmo.
 
    * head
        visualiza o início do arquivo.

    * tail
        visualiza o final do arquivo.

    * nl
        Visualiza com numeração das linhas.

    * od
        Visualiza arquivo binário em base octal.

    * xxd
        Visualiza arquivo binário em base hexadecimal.

    * gv
        Visualiza arquivos Postscript/PDF.

    * xdvi
        Visualiza arquivos DVI gerados pelo TeX.


Criação e Edição de Arquivos:
-----------------------------

    * emacs
        Editor de textos.

    * vim
        Editor de textos (':q' para sair. ;-p)

    * gnumeric
        Editar planilhas.

    * abiword
        Processador de textos

    * oofice
        inicia o openoffice


Propriedades dos Arquivos:
--------------------------

    * stat
        Mostra atributos dos arquivos.

    * wc
        conta bytes/palavras/linhas.

    * du
        Uso de espaço em disco.

    * file
        Identifica tipo do arquivo.

    * touch
        Atualiza registro de ultima atualização do arquivo. Caso o
    arquivo não exista ele é criado.

    * chown
        Altera o dono o arquivo.

    * chgrp
        Altera o grupo o arquivo.

    * chmod
        Altera as permissões de um arquivo.

    * chattr
        Altera atributos avançados de um arquivo.

    * lsattr
        Lista atributos avançados do arquivo.


Localização de Arquivos:
------------------------

    * find
        localiza arquivos.

    * locate
        Localiza arquivo por meio de índice criado com
    ``updatedb``.

    * which
        Localiza comandos.

    * whereis
        Localiza o binário (executável), fontes, e página man de
    um comando.


Manipulação de Arquivos Texto:
------------------------------

    * grep
        Busca em texto retornando linhas.

    * cut
        Extrai colunas de um arquivo.

    * paste
        Anexa colunas de um arquivo texto.

    * sort
        Ordena linhas.

    * uniq
        Localiza linhas idênticas.


Compressão de Arquivos:
-----------------------

    * gzip
        Compacta arquivos no formato GNU Zip.

    * compress
        Compacta arquivos.

    * bzip2
        Compacta arquivos(maior compactação do que o gzip, porém
    mais lento.

    * zip
        Compacta arquivos no formato zip(Windows).


Comparação de Arquivos:
-----------------------

    * diff
        Compara arquivos linha a linha.

    * comm
        Compara arquivos ordenados.

    * cmp
        Compara arquivos byte por byte.

    * md5sum
        Calcula checksums.


Discos e Sistemas de Arquivos:
------------------------------

    * df
        Espaço livre em todos os discos(pendrives e etc.) montados.

    * mount
        Torna um disco acessível.

    * fsck
        Verifica um disco procurando por erros.

    * sync
        Esvazia caches de disco.


Impressão:
----------

    * lpr
        Imprime arquivos na impressora padrão do sistema.

    * lpq
        Visualiza a fila de impressão.

    * lprm
        Remove arquivos da fila de impressão.


Verificação Ortográfica:
------------------------

    * ispell
        verificação ortográfica interativa.

    * dict
        Cliente para servidor de dicionários. Busca palavras.


Processos:
----------

    * ps
        Lista todos os processos.

    * w
        Lista os processos do usuário.

    * uptime
        Retorna tempo desde o último boot, e carga do sistema.

    * top
        Monitora Processos.

    * free
        Mostra memória livre.

    * kill
        Mata processos.

    * nice
        Ajusta a prioridade de um processo.

    * renice
        Altera a prioridade de um processo.


Agendando Tarefas:
------------------

    * watch
        Executa programas a intervalos regulares.

    * crontab
        Agenda tarefas periódicas.


Sistema e Rede:
---------------

    * uname
        Mostra informações sobre o sistema.

    * hostname
        Mostra o nome da máquina.

    * ifconfig
        Mostra/ajusta configuração de rede.

    * host
        Busca na tabela de DNS.

    * ping
        verifica se determinada máquina está acessível.

    * traceroute
        Visualiza o caminho ate uma determinada máquina.

    * ssh
        Login remoto seguro.

    * telnet
        Login remoto.

    * scp
        Cópia segura de arquivos entre máquinas.

    * sftp
        Cópia segura de arquivos entre máquinas.

    * ftp
        Cópia de arquivos entre máquinas.

    * pine
        Cliente de email modo texto amigável.

    * mutt
        Cliente de email modo texto.

    * mail
        Cliente de email mínimo.

    * links
        Navegador web em modo texto.

    * wget
        Download de páginas da web.

    * gaim
        Mensagem instantâneas (requer interface gráfica).

    * write
        Envia mensagens para outro usuário.

    * mesg
        Permite/proibe escrita no seu terminal via ``write``.


Audio e Vídeo:
--------------

    * grip
        Toca CDs e extrai seu conteúdo para arquivos mp3(requer
    interface gráfica).

    * xmms
        Toca arquivos de áudio.




