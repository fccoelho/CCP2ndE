.. role:: math(raw)
   :format: html latex

===============================
Introdução ao Console Gnu/Linux
===============================

    Guia de sobrevivência no console do Gnu/Linux

O console Gnu/Linux é um poderoso ambiente de trabalho, em
contraste com a interface limitada, oferecida pelo sistema
operacional DOS, ao qual é comumente comparado. O console Gnu/Linux
tem uma longa história desde sua origem no "Bourne shell",
distribuido com o Sistema operacional(SO) UNIX versão 7. Em sua
evolução, deu origem a algumas variantes. A variante mais
amplamente utilizada e que será objeto de utilização e análise
neste capítulo é o Bash ou "Bourne Again Shell". Ao longo deste
capítulo o termo console e shell serão utilizados com o mesmo
sentido, ainda que, tecnicamente não sejam sinônimos. Isto se deve
à falta de uma tradução mais adequada para a palavra inglesa
shell".

Qual a relevância de um tutorial sobre shell em um livro sobre
computação científica? Qualquer cientista com alguma experiência em
computação está plenamente consciente do fato de que a maior parte
do seu trabalho, se dá através da combinação da funcionalidade de
diversos aplicativos científicos para a realização de tarefas
científicas de maior complexidade. Neste caso, o ambiente de
trabalho é chave para agilizar esta articulação entre aplicativos.
Este capítulo se propõe a demonstrar, através de exemplos, que o
GNU/Linux é um ambiente muito superior para este tipo de atividade,
se comparado com Sistemas Operacionais voltados principalmente para
usuários leigos.

Além do Console e sua linguagem (bash), neste capítulo vamos
conhecer diversos aplicativos disponíveis no sistema operacional
Gnu/Linux, desenvolvidos para serem utilizados no console.

A linguagem BASH
================

A primeira coisa que se deve entender antes de começar a estudar o
shell do Linux, é que este é uma linguagem de programação bastante
poderosa em si mesmo. O termo Shell, cápsula, traduzido
literalmente, se refere à sua função como uma interface entre o
usuário e o sistema operacional. A shell nos oferece uma interface
textual para invocarmos aplicativos e lidarmos com suas entradas e
saídas. A segunda coisa que se deve entender é que a shell não é o
sistema operacional, mas um aplicativo que nos facilita a interação
com o SO.

O Shell não depende de interfaces gráficas sofisticadas, mas
comumente é utilizado através de uma janela, do conforto de uma
interface gráfica. Na figura fig:shell, vemos um exemplo de uma
sessão do bash rodando em uma janela.



Alguns Comando Úteis
--------------------

    ls
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
	Remove um diretório. Para remover recursivamente toda uma
        árvore de diretórios use rm -rf(cuidado!).

        * cat
	Joga o arquivo inteiro na tela.

        * less
	Visualiza o arquivo com possibilidade de movimentação e busca
        dentro do mesmo.

        * head
	Visualiza o início do arquivo.

        * tail
	Visualiza o final do arquivo.

        * nl
	Visualiza com numeração das linhas.

        * od
	Visualiza arquivo binário em base octal.

        * xxd
	Visualiza arquivo binário em base hexadecimal.

        * gv
	Visualiza arquivos Postscript/PDF.

        * xdvi
	Visualiza arquivos DVI gerados pelo .

        * stat
	Mostra atributos dos arquivos.

        * wc
	Conta bytes/palavras/linhas.

        * du
	Uso de espaço em disco.

        * file
	Identifica tipo do arquivo.

        * touch
	Atualiza registro de última atualização do arquivo. Caso o
        arquivo não exista, é criado.

        * chown
	Altera o dono do arquivo.

        * chgrp
	Altera o grupo do arquivo.

        * chmod
	Altera as permissões de um arquivo.

        * chattr
	Altera atributos avançados de um arquivo.

        * lsattr
	Lista atributos avançados do arquivo.

        * find
	Localiza arquivos.

        * locate
	Localiza arquivo por meio de índice criado com updatedb.

        * which
	Localiza comandos.

        * whereis
	Localiza o binário (executável), fontes, e página man de
        um comando.

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

        * gzip
	Compacta arquivos no formato GNU Zip.

        * compress
	Compacta arquivos.

        * bzip2
	Compacta arquivos(maior compactação do que o gzip, porém
        mais lento.

        * zip
	Compacta arquivos no formato zip(Windows).

        * diff
	Compara arquivos linha a linha.

        * comm
	Compara arquivos ordenados.

        * cmp
	Compara arquivos byte por byte.

        * md5sum
	Calcula checksums.

        * df
	Espaço livre em todos os discos(pendrives e etc.) montados.

        * mount
	Torna um disco acessível.

        * fsck
	Verifica um disco procurando por erros.

        * sync
	Esvazia caches de disco.

        * ps
	Lista todos os processos.

        * w
	Lista os processos do usuário.

        * uptime
	Retorna tempo desde o último boot, e carga do sistema.

        * top
	Monitora processos em execução.

        * free
	Mostra memória livre.

        * kill
	Mata processos.

        * nice
	Ajusta a prioridade de um processo.

        * renice
	Altera a prioridade de um processo.

        * watch
	Executa programas a intervalos regulares.

        * crontab
	Agenda tarefas periódicas.



Entradas e Saídas, redirecionamento e "Pipes".
==============================================

O esquema padrão de entradas e saídas dos SOs derivados do UNIX,
está baseado em duas idéias muito simples: toda comunicaçao é
formada por uma sequência arbitrária de caracteres (Bytes), e
qualquer elemento do SO que produza ou aceite dados é tratado como
um arquivo, desde dispositivos de hardware até programas.

Por convenção um programa UNIX apresenta três canais de comunicação
com o mundo externo: entrada padrão ou STDIN, saída padrao ou
STDOUT e saída de erros padrão ou STDERR.

O Bash(assim como praticamente todas as outras shells) torna muito
simples a utilização destes canais padrão. Normalmente, um usuário
utiliza estes canais com a finalidade de redirecionar dados através
de uma sequência de passos de processamento. Como este processo se
assemelha ao modo como canalizamos àgua para levá-la de um ponto ao
outro, Estas construções receberam o apelido de pipelines" ou
tubulações onde cada segmento é chamado de pipe".

Devido a essa facilidade, muitos dos utilitários disponíveis na
shell do Gnu/Linux foram desenvolvidos para fazer uma única coisa
bem, uma vez que funções mais complexas poderiam ser obtidas
combinando programas através de pipelines".

Redirecionamento
----------------

Para redirecionar algum dado para o STDIN de um programa,
utilizamos o caracter :math:`$<$`. Por exemplo, suponha que temos
um arquivo chamado ``nomes`` contendo uma lista de nomes, um por
linha. O comando {sort < nomes} irá lançar na tela os nomes
ordenados alfabeticamente. De maneira similar, podemos utilizar o
caracter :math:`$>$` para redirecionar a saida de um programa para
um arquivo, por exemplo.

    :math:`$ sort < nomes > nomes_ordenados
\end{lstlisting}

O comando do exemplo \ref{ex:redir}, cria um novo arquivo com o conteúdo do arquivo \texttt{nomes}, ordenado.

\subsection{``Pipelines''}
Podemos também redirecionar saídas de comandos para outros comandos, ao invés de arquivos, como vimos anteriormente. O caractere que usamos para isto é o \texttt{$`:math:`$} conhecido como ``pipe''. Qualquer linha de comando conectando dois ou mais comandos através de ``pipes'' é denominada de ``pipeline''.
\begin{lstlisting}* language=csh, caption=Lista ordenada dos usuários do sistema. ,label=ex:pipe
	
$`
    cut -d: -f1 /etc/passwd sort ajaxterm avahi avahi-autoipd backup
    beagleindex bin boinc ...


O simples exemplo apresentado dá uma idéia do poder dos
"pipelines", além da sua conveniência para realizar tarefas
complexas, sem a necessidade de armazenar dados intermediários em
arquivos, antes de redirecioná-los a outros programas.
{Pérolas Científicas do Console Gnu/Linux} O console Gnu/Linux
extrai a maior parte da sua extrema versatilidade de uma extensa
coleção de aplicativos leves desenvolvidos * 1
	_ para serem
utilizados diretamente do console. Nesta seção, vamos ver alguns
exemplos, uma vez que seria impossível explorar todos eles, neste
simples apêndice.

Gnu plotutils
-------------

O "GNu Ploting Utilities" é uma suite de aplicativos gráficos e
matemáticos desenvolvidos para o console Gnu/Linux. São eles:

graph
    Lê um ou mais conjuntos de dados a partir de arquivos ou de STDIN e
    prepara um gráfico;

    * plot
	 Converte Gnu metafile para qualquer dos formatos listados
    acima;

    * pic2plot
	 Converte diagramas criados na linguagem ``pic`` para
    qualquer dos formatos acima;

    * tek2plot
	 Converte do formato Tektronix para qualquer dos formatos
    acima.


Estes aplicativos gráficos podem criar e exportar gráficos
bi-dimensionais em treze formatos diferentes:
``SVG, PNG, PNM, pseudo-GIF, WebCGM, Illustrator, Postscript, PCL 5, HP-GL/2, Fig (editável com o editor de desenhos xfig), ReGIS, Tektronix ou GNU Metafile``.

{Aplicativos Matemáticos:}

    {EDO}

    ode
    Integra numericamente sistemas de equações diferenciais ordinárias
    (EDO);

    * spline
	 Interpola curvas utilizando "splines" cúbicas ou
    exponenciais. Pode ser utilizado como filtro em tempo real.


``graph``
~~~~~~~~~

{graph} A cada vez que chamamos o programa ``graph``, ele lê um ou
mais conjuntos de dados a partir de arquivos especificados na linha
de comando, ou diretamente da ``STDIN``, e produz um gráfico. O
gráfico pode ser mostrado em uma janela, ou salvo em um arquivo em
qualquer dos formatos suportados.

    :math:`$ graph -T png < arquivo_de_dados_ascii > plot.png
\end{lstlisting}

Se o \texttt{arquivo\_de\_dados\_ascii} contiver duas colunas de números, o programa as atribuirá a \texttt{x} e \texttt{y}, respectivamente. Os pares ordenados que darão origem aos pontos do gráfico não precisam estar em linhas diferentes. por exemplo:
\begin{lstlisting}* language=csh, caption=Desenhando um quadrado. ,label=ex:graphq
	
$`
    echo .1 .1 .1 .9 .9 .9 .9 .1 .1 .1 graph -T X -C -m 1 -q 0.3


A listagem ex:graphq plotará um quadrado com vértices em
``(0.1,0.1)``, ``(0.1,0.9)``, ``(0.9,0.9)`` e ``(0.9,0.1)``. A
repetição do primeiro vértice garante que o polígono será fechado.
A opção ``-m`` indica o tipo da linha utilizada: 1-linha sólida,
2-pontilhada, 3-ponto e traço, 4-traços curtos e 5-traços longos. A
opção ``-q`` indica que o quadrado será preenchido (densidade 30%)
com a mesma cor da linha: vermelho (``-C`` indica gráfico
colorido).

O programa ``graph`` aceita ainda muitas outras opções. Leia o
manual({man graph}) para descobrí-las.

``spline``
~~~~~~~~~~

O programa funciona de forma similar ao ``graph`` no que diz
respeito à entradas e saídas. Como todos os aplicativos de console,
beneficia-se muito da interação com outros programas via "pipes".

    :math:`$ echo 0 0 1 1 2 0 | spline | graph -T X
\end{lstlisting}
\begin{figure}
 \centering
 \includegraphics* width=10cm
	{spline.png}
 % spline.png: 578x594 pixel, 72dpi, 20.39x20.95 cm, bb=0 0 578 594
 \caption{Usando \texttt{spline}.}
 \label{fig:spline}
\end{figure}

Spline não serve apenas para interpolar funções, também pode ser usado para interpolar curvas em um espaço d-dimensional utilizando-se a opçao \texttt{-d}.
\begin{lstlisting}* language=csh, caption=Interpolando uma curva em um plano. ,label=ex:splinec
	
echo 0 0 1 0 1 1 0 1 | spline -d 2 -a -s | graph -T X
\end{lstlisting}

O comando da listagem \ref{ex:splinec} traçará uma curva passando pelos pontos \texttt{(0,0)}, \texttt{(1,0)}, \texttt{(1,1)} e \texttt{(0,1)}. A opção \texttt{-d 2} indica que a variável dependente é bi-dimensional. A opção \texttt{-a} indica que a variável independente deve ser gerada automáticamente e depois removida da saída (opção \texttt{-s}).
\begin{figure}
 \centering
 \includegraphics* width=10cm
	{splinec.png}
 % splinec.png: 578x594 pixel, 72dpi, 20.39x20.95 cm, bb=0 0 578 594
 \caption{Interpolando uma curva em um plano.}
 \label{fig:splinec}
\end{figure}

\subsubsection{\texttt{ode}}

O utilitário \texttt{ode} é capaz de produzir uma solução numérica de sistemas de equações diferenciais ordinárias. A saída de \texttt{ode} pode ser redirecionada para o utilitário \texttt{graph}, que já discutimos anteriormente, de forma que as soluções sejam plotadas diretamente, à medida em que são calculadas.

Vejamos um exemplo simples:
\begin{equation}
 \dfrac{dy}{dt}=y(t)
\end{equation} 

A solução desta equação é:

\begin{equation}
 y(t)=e^t
\end{equation} 

Se nós resolvermos esta equação numericamente, a partir do valor inicial $`y(0)=1:math:`$, até $`t=1:math:`$ esperaríamos obter o valor de $`e:math:`$ como último valor da nossa curva ($`e1=2.718282:math:`$, com 7 algarismos significativos). Para isso digitamos no console:
\begin{lstlisting}* language=csh, caption= Resolvendo uma equação diferencial simples no console do Linux. ,label=ex:ode1
	
$`
    ode y'=y y=1 print t,y step 0,1


Após digitar a ultima linha do exemplo ex:ode1, duas colunas de
números aparecerão: a primeira correspondendo ao valor de t e a
segunda ao valor de y; a ultima linha será :math:`$1\;\;2.718282$`.
Como esperávamos.

Para facilitar a re-utilização dos modelos, podemos colocar os
comandos do exemplo ex:ode1 em um arquivo texto. Abra o seu editor
favorito, e digite o seguinte modelo:
* language=csh,frame=trBL, caption=Sistema de três equações diferenciais acopladas ,label=ex:lorenz
	 {code/lorenz}

Salve o arquivo com o nome ``lorenz``. Agora digite no console a
seguinte linha de comandos:

    ode lorenz graph -T X -C -x -10 10 -y -20 20


E eis que surgirá a bela curva da figura fig:lorenz.



.. * 1
	  Desenvolvidos principalmente pelo projeto Gnu


