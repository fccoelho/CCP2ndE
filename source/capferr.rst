.. role:: math(raw)
   :format: html latex

{Ferramentas de Desenvolvimento}
{Exposição de ferramentas voltadas para o aumento da produtividade em um ambiente de trabalho em computação científica. \\textbf{Pré-requisitos:} Capítulos \\ref{cap:intro} e \\ref{cap:obj}}

{C}omo em todo ambiente de trabalho, para aumentar a nossa
produtividade em Computação Científica, existem várias ferramentas
além da linguagem de programação. Neste capítulo falaremos das
ferramentas mais importantes, na opinião do autor.
{Ipython}{Ipython} (sec:ipython) A utilização interativa do Python
é de extrema valia. Outros ambientes voltados para computação
científica, tais como Matlab, R, Mathematica dentre outros, usam o
modo interativo como seu principal modo de operação. Os que desejam
fazer o mesmo com o Python, podem se beneficiar imensamente do
``Ipython``.

O Ipython é uma versão muito sofisticada da shell do Python voltada
para tornar mais eficiente a utilização interativa da linguagem
Python. {Primeiros Passos} Para iniciar o Ipython, digitamos o
seguinte comando:

{lstlisting} [language=csh, caption= ,label=]
:math:`$ ipython [opções] arquivos
\end{lstlisting}
Muita das opções que controlam o funcionamento do Ipython não são passadas na linha de comando, estão especificadas no arquivo \texttt{ipythonrc} dentro do diretório \texttt{~/.ipython}.

Quatro opções do Ipython são consideradas especiais e devem aparecer em primeiro lugar, antes de qualquer outra opção: \texttt{-gthread, -qthread, -wthread, -pylab}. As três primeiras opções são voltadas para o uso interativo de módulos na construção de GUIs (interfaces gráficas), respectivamente \texttt{GTK}, \texttt{Qt}, \texttt{WxPython}. Estas opções iniciam o Ipython em um ``thread'' separado, de forma a permitir o controle interativo de elementos gráficos. A opção \texttt{-pylab} permite o uso interativo do pacote matplotlib (Ver capítulo \ref{ch:plot}). Esta opção executará \lstinline{from pylab import *} ao iniciar, e permite que gráficos sejam exibidos sem necessidade de invocar o comando \texttt{show()}, mas executará scripts que contém \texttt{show()} ao final, corretamente.

Após uma das quatro opções acima terem sido especificadas, as opções regulares podem seguir em qualquer ordem. Todas as opções podem ser abreviadas à forma mais curta não-ambígua, mas devem respeitar maiúsculas e minúsculas (como nas linguagens Python e Bash, por sinal). Um ou dois hífens podem ser utilizados na especificação de opções.

Todas as opções podem ser prefixadas por ``no'' para serem desligadas (no caso de serem ativas por default). 

Devido ao grande número de opções existentes, não iremos listá-las aqui. consulte a documentação do Ipython para aprender sobre elas. Entretanto, algumas opções poderão aparecer ao longo desta seção e serão explicadas à medida em que surgirem.
\subsection{Comandos Mágicos}\index{Ipython!Comandos mágicos}
Uma das características mais úteis do Ipython é o conceito de comandos mágicos. No console do Ipython, qualquer linha começada pelo caractere \%, é considerada uma chamada a um comando mágico. Por exemplo, \texttt{\%autoindent} liga a indentação automática dentro do Ipython.

Existe uma opção que vem ativada por default no \texttt{ipythonrc}, denomidada \texttt{automagic}. Com esta função, os comandos mágicos podem ser chamados sem o \%, ou seja \texttt{autoindent} é entendido como \texttt{\%autoindent}. Variáveis definidas pelo usuário podem mascarar comandos mágicos. Portanto, se eu definir uma variável \lstinline{autoindent = 1}, a palavra \texttt{autoindent} não é mais reconhecida como um comando mágico e sim como o nome da variável criada por mim. Porém, ainda posso chamar o comando mágico colocando o caractere \% no início.

O usuário pode extender o conjunto de comandos mágicos com suas próprias criações. Veja a documentação do Ipython sobre como fazer isso.

O comando mágico \texttt{\%magic} retorna um explicação dos comandos mágicos existentes.

\begin{description}
 \item[\texttt{\%Exit}] Sai do console Ipython.
\item [\texttt{\%Pprint}] Liga/desliga formatação do texto.
\item [\texttt{\%Quit}] Sai do Ipython sem pedir confirmação.
\item [\texttt{\%alias}] Define um sinônimo para um comando.
 \end{description}
Você pode usar \texttt{\%1} para representar a linha em que o comando \texttt{alias foi chamado}, por exemplo:
\begin{lstlisting}[caption= ,label=]
In [2]: alias all echo "Entrada entre parênteses: (%l)"
In [3]: all Ola mundo
Entrada entre parênteses: (Ola mundo)
\end{lstlisting}

\begin{description}
 \item[\texttt{\%autocall}] Liga/desliga modo que permite chamar funções sem os parênteses. Por exemplo: \texttt{fun 1} vira fun(1).
\item [\texttt{\%autoindent}] Liga/desliga auto-indentação.
\item [\texttt{\%automagic}] Liga/desliga auto-mágica.
\item [\texttt{\%bg}] Executa um comando em segundo plano, em um thread separado. Por exemplo: \texttt{\%bg func(x,y,z=1)}. Assim que a execução se inicia, uma mensagem é impressa no console informando o número da tarefa. Assim, pode-se ter acesso ao resultado da tarefa número 5 por meio do comando \texttt{jobs.results[5]} 
 \end{description}

O Ipython possui um gerenciador de tarefas acessível através do objeto \texttt{jobs}. Para maiores informações sobre este objeto digite \texttt{jobs?}. O Ipython permite completar automaticamente  um comando digitado parcialmente. Para ver todos os métodos do objeto \texttt{jobs} experimente digitar \texttt{jobs.}seguido da tecla <TAB>.

\begin{description}
 \item[\texttt{\%bookmark}]Gerencia o sistema de marcadores do Ipython. Para saber mais sobre marcadores digite \texttt{\%bookmark?}.
\item [\texttt{\%cd}] Muda de diretório. 
\item [\texttt{\%colors}]Troca o esquema de cores.
\item [\texttt{\%cpaste}]Cola e executa um bloco pré-formatado da área de transferência (clipboard). O bloco tem que ser terminado por uma linha contendo \lstinline{--}.
\item [\texttt{\%dhist}]Imprime o histórico de diretórios.
\item [\texttt{\%ed}]Sinônimo para \texttt{\%edit}
\item [\texttt{\%edit}] Abre um editor e executa o código editado ao sair. Este comando aceita diversas opções, veja a documentação. 
\end{description}

O editor a ser aberto pelo comando \texttt{\%edit} é o que estiver definido na variável de ambiente \texttt{\$`EDITOR.
Se esta variável não estiver definida, o Ipython abrirá o ``vi``.
Se não for especificado o nome de um arquivo, o Ipython abrirá um
arquivo temporário para a edição.

O comando {\\%edit} apresenta algumas conveniências. Por exemplo:
se definirmos uma funcão ``fun`` em uma sessão de edição ao sair e
executar o código, esta função permanecerá definida no espaço de
nomes corrente. Então podemos digitar apenas {\\%edit fun} e o
Ipython abrirá o arquivo que a contém, posicionando o cursor,
automaticamente, na linha que a define. Ao sair desta sessão de
edição, a função editada será atualizada.

    In [6]:

    IPython will make a temporary file named: /tmp/ipythoneditGuUWr.py
    done. Executing edited code... Out[6]:"def fun(): print 'fun'
    funa(): print 'funa'"

    In [7]:fun() fun

    In [8]:funa() funa

    In [9]:

    done. Executing edited code...


{\\%hist}
    Sinônimo para {\\%history}.

    [{\\%history}]Imprime o histórico de comandos. Comandos anteriores
    também podem ser acessados através da variável {\\\_i<n>}, que é o
    n-ésimo comando do histórico.


    In [1]:

    1: ip.magic("

    In [2]:

    1: ip.magic("

    2: ip.magic("


O Ipython possui um sofisticado sistema de registro das sessões.
Este sistema é controlado pelos seguintes comandos mágicos:
{\\%logon, \\%logoff, \\%logstart e \\%logstate}. Para maiores
informações consulte a documentação.

{\\%lsmagic}
    Lista os comandos mágicos disponíveis.

    [{\\%macro}]Define um conjunto de linhas de comando como uma macro
    para uso posterior: {\\%macro teste 1 2} ou
    {\\%macro macro2 44-47 49}.

    [{\\%p}]Sinônimo para print.

    [{\\%pdb}]liga/desliga depurador interativo.

    [{\\%pdef}]Imprime o cabeçalho de qualquer objeto chamável. Se o
    objeto for uma classe, retorna informação sobre o construtor da
    classe.

    [{\\%pdoc}]Imprime a docstring de um objeto.

    [{\\%pfile}]Imprime o arquivo onde o objeto encontra-se definido.

    [{\\%psearch}]Busca por objetos em espaços de nomes.

    [{\\%psource}]Imprime o código fonte de um objeto. O objeto tem que
    ter sido importado a partir de um arquivo.

    [{\\%quickref}]Mostra um guia de referência rápida

    [{\\%quit}]Sai do Ipython.

    [{\\%r}] Repete o comando anterior.

    [{\\%rehash}]Atualiza a tabela de sinônimos com todas as entradas
    em {\\$PATH}. Este comando não verifica permissões de execução e se
    as entradas são mesmo arquivos. {\\%rehashx} faz isso, mas é mais
    lento.

    [{\\%rehashdir}]Adiciona os executáveis dos diretórios
    especificados à tabela de sinônimos.

    [{\\%rehashx}]Atualiza a tabela de sinônimos com todos os arquivos
    executáveis em {\\$PATH}.

    [{\\%reset}]Re-inicializa o espaço de nomes removendo todos os
    nomes definidos pelo usuário.

    [{\\%run}] Executa o arquivo especificado dentro do Ipython como um
    programa.

    [{\\%runlog}] Executa arquivos como logs.

    [{\\%save}]Salva um conjunto de linhas em um arquivo.

    [{\\%sx}] Executa um comando no console do Linux e captura sua
    saída.

    [{\\%store}]Armazena variáveis para que estejam disponíveis em uma
    sessão futura.

    [{\\%time}] Cronometra a execução de um comando ou expressão.

    [{\\%timeit}]Cronometra a execução de um comando ou expressão
    utilizando o módulo ``timeit``.

    [{\\%unalias}]Remove um sinônimo.

    [{\\%upgrade}]Atualiza a instalação do Ipython.

    [{\\%who}]Imprime todas as variáveis interativas com um mínimo de
    formatação.

    [{\\%who\\\_ls}]Retorna uma lista de todas as variáveis
    interativas.

    [{\\%whos}]Similar ao {\\%who}, com mais informação sobre cada
    variável.


Para finalizar, o Ipython é um excelente ambiente de trabalho
interativo para computação científica, especialmente quando
invocado coma opção ``-pylab``. O modo ``pylab`` além de gráficos,
também oferece uma série de comandos de compatibilidade com o
MATLAB (veja capítulo ch:plot). O pacote principal do ``numpy``
também fica exposto no modo ``pylab``. Subpacotes do numpy precisam
ser importados manualmente. {Editores de Código}{editores} Na
edição de programas em Python, um bom editor de código pode fazer
uma grande diferença em produtividade. Devido a significância dos
espaços em branco para a linguagem, um editor que mantém a
indentação do código consistente, é muito importante para evitar
``bugs``. Também é desejável que o editor conheça as regras de
indentação do Python, por exemplo: indentar após "``:``", indentar
com espaços ao invés de tabulações. Outra característica desejável
é a colorização do código de forma a ressaltar a sintaxe da
linguagem. Esta característica aumenta, em muito, a legibilidade do
código.

Os editores que podem ser utilizados com sucesso para a edição de
programas em Python, se dividem em duas categorias básicas:
editores genéricos e editores especializados na linguagem Python.
Nesta seção, vamos examinar as principais características de alguns
editores de cada categoria.

Editores Genéricos
------------------

{Editores}

Existe um sem-número de editores de texto disponíveis para o
Ambiente Gnu/Linux. A grande maioria deles cumpre nossos requisitos
básicos de indentação automática e colorização. Selecionei alguns
que se destacam na minha preferência, quanto a usabilidade e
versatilidade.

Emacs:
    Editor incrivelmente completo e versátil, funciona como ambiente
    integrado de desenvolvimento (figura fig:emacs). Precisa ter
    "python-mode"instalado. Para quem não tem experiência prévia com o
    Emacs, recomendo que o pacote ``Easymacs`` [1]_ seja também
    instalado. este pacote facilita muito a interface do Emacs,
    principalmente para adição de atalhos de teclado padrão ``CUA``.
    Pode-se ainda utilizar o Ipython dentro do Emacs. {Emacs}

    

    [Scite:]Editor leve e eficiente, suporta bem o Python (executa o
    script com F5) assim como diversas outras linguagens. Permite
    configurar comando de compilação de C e Fortran, o que facilita o
    desenvolvimento de extensões. Completamente configurável (figura
    fig:scite).{Scite}

    

    [Gnu Nano:]Levíssimo editor para ambientes de console, possui
    suporte a auto indentação e colorização em diversas linguagens,
    incluindo o Python (figura fig:nano). Ideal para utilizar em
    conjunção com o Ipython (comando {\\%edit}).{Gnu Nano}

    

    [Jedit:] Incluí o Jedit nesta lista, pois oferece suporte ao
    desenvolvimento em Jython (ver Seção sec:jython). Afora isso, é um
    editor bastante poderoso para java e não tão pesado quanto o
    Eclipse (figura fig:jedit).{Jedit}

    

    [Kate/Gedit] Editores padrão do KDE e Gnome respectivamente. Bons
    para uso casual, o Kate tem a vantagem de um console embutido.


Editores Especializados
-----------------------

{IDEs} Editores especializados em Python tendem a ser mais do tipo
IDE (ambiente integrado de desenvolvimento), oferecendo
funcionalidades que só fazem sentido para gerenciar projetos de
médio a grande porte, sendo "demais" para se editar um simples
Script.

Boa-Constructor:
    O Boa-constructor é um IDE, voltado para o projetos que pretendam
    utilizar o WxPython como interface gráfica. Neste aspecto ele é
    muito bom, permitindo construção visual da interface, gerando todo
    o código associado com a interface. Também traz um excelente
    depurador para programas em Python e dá suporte a módulos de
    extensão escritos em outras linguagens, como ``Pyrex`` ou
    ``C``(figura fig:boa).

    

    [Eric:]O Eric também é um IDE desenvolvido em Python com a
    interface em PyQt. Possui boa integração com o gerador de
    interfaces ``Qt Designer``, tornando muito fácil o desenvolvimento
    de interfaces gráficas com esta ferramenta. Também dispõe de ótimo
    depurador. Além disso o Eric oferece muitas outras funções, tais
    como integração com sistemas de controle de versão, geradores de
    documentação, etc.(Figura fig:eric).

    

    [Pydev (Eclipse):]O Pydev, é um IDE para Python e Jython
    desenvolvido como um plugin para Eclipse. Para quem já tem
    experiência com a plataforma Eclipse, pode ser uma boa alternativa,
    caso contrário, pode ser bem mais complicado de operar do que as
    alternativas mencionadas acima (Figura fig:pydev). Em termos de
    funcionalidade, equipara-se ao Eric e ao Boa-constructor.

    


Controle de Versões em Software
===============================

{Controle de Versões} Ao se desenvolver software, em qualquer
escala, experimentamos um processo de aperfeiçoamento progressivo
no qual o software passa por várias versões. Neste processo é muito
comum, a um certo estágio, recuperar alguma funcionalidade que
estava presente em uma versão anterior, e que, por alguma razão,
foi eliminada do código.

Outro desafio do desenvolvimento de produtos científicos (software
ou outros) é o trabalho em equipe em torno do mesmo objeto
(frequentemente um programa). Normalmente cada membro da equipe
trabalha individualmente e apresenta os seus resultados para a
equipe em reuniões regulares. O que fazer quando modificações
desenvolvidas por diferentes membros de uma mesma equipe se tornam
incompatíveis? Ou mesmo, quando dois ou mais colaboradores estão
trabalhando em partes diferentes de um programa, mas que precisam
uma da outra para funcionar?

O tipo de ferramenta que vamos introduzir nesta seção, busca
resolver ou minimizar os problemas supracitados e pode ser aplicado
também ao desenvolvimento colaborativo de outros tipos de
documentos, não somente programas.

Como este é um livro baseado na linguagem Python, vamos utilizar um
sistema de controle de versões desenvolvido inteiramente em Python:
``Mercurial`` [2]_. Na prática o mecanismo por trás de todos os
sistemas de controle de versão é muito similar. Migrar de um para
outro é uma questão de aprender novos nomes para as mesmas
operações. Além do mais, o uso diário de sistema de controle de
versões envolve apenas dois ou três comandos.
{Entendendo o Mercurial} {Mercurial}
{Controle de Versões!Mercurial} O Mercurial é um sistema de
controle de versões descentralizado, ou seja, não há nenhuma noção
de um servidor central onde fica depositado o código. Repositórios
de códigos são diretórios que podem ser "clonados" de uma máquina
para outra.

Então, em que consiste um repositório? A figura fig:mercrep é uma
representação diagramática de um repositório. Para simplificar
nossa explanação, consideremos que o repositório já foi criado ou
clonado de alguém que o criou. Veremos como criar um repositório a
partir do zero, mais adiante.



De acordo com a figura fig:mercrep, um repositório é composto por
um Arquivo [3]_ e por um diretório de trabalho. O Arquivo contém a
história completa do projeto. O diretório de trabalho contém uma
cópia dos arquivos do projeto em um determinado ponto no tempo (por
exemplo, na revisão 2). É no diretório de trabalho que o
pesquisador trabalha e atualiza os arquivos.

Ao final de cada ciclo de trabalho, o pesquisador envia suas
modificações para o arquivo numa operação denominada
"commit"(figura fig:commit) [4]_.



Após um ``commit``, como as fontes do diretório de trabalho não
correspondiam à última revisão do projeto, o ``Mercurial``
automaticamente cria uma ramificação no arquivo. Com isso passamos
a ter duas linhas de desenvolvimento seguindo em paralelo, com o
nosso diretório de trabalho pertencendo ao ramo iniciado pela
revisão 4.

O ``Mercurial`` agrupa as mudanças enviadas por um usuário (via
``commit``), em um conjunto de mudanças atômico, que constitui uma
revisão. Estas revisões recebem uma numeração sequencial (figura
fig:commit). Mas como o ``Mercurial`` permite desenvolvimento de um
mesmo projeto em paralelo, os números de revisão para diferentes
desenvolvedores poderiam diferir. Por isso cada revisão também
recebe um identificador global, consistindo de um número
hexadecimal de quarenta dígitos.

Além de ramificações, fusões ("merge") entre ramos podem ocorrer a
qualquer momento. Sempre que houver mais de um ramo em
desenvolvimento, o ``Mercurial`` denominará as revisões mais
recentes de cada ramo(``heads, cabeças``). Dentre estas, a que
tiver maior número de revisão será considerada a ponta (``tip``) do
repositório. {Exemplo de uso:}

Nestes exemplos, exploraremos as operações mais comuns num ambiente
de desenvolvimento em colaboração utilizando o ``Mercurial``.

Vamos começar com nossa primeira desenvolvedora, chamada Ana. Ana
possui um arquivo como mostrado na figura fig:ana1.



Nosso segundo desenvolvedor, Bruno, acabou de se juntar ao time e
clona o repositório Ana [5]_.

    :math:`$ hg clone ssh://maquinadana/projeto meuprojeto
requesting all changes
adding changesets
adding manifests
adding file changes
added 4 changesets with 4 changes to 2 files
\end{lstlisting}
\begin{leftbar} 
\textbf{URLs válidas:}\\file://\\ http://\\ https://\\ ssh://\\ static-http://
\end{leftbar}

Após o comando acima, Bruno receberá uma cópia completa do arquivo de Ana, mas seu diretório de trabalho, \texttt{meu projeto}, permanecerá independente. Bruno está ansioso para começar a trabalhar e logo faz dois \texttt{commits} (figura \ref{fig:bruno1}).
\begin{figure}
 \centering
 \includegraphics[width=10cm]{bruno1.png}
 % bruno1.png: 410x60 pixel, 72dpi, 14.46x2.12 cm, bb=0 0 410 60
 \caption{Modificações de Bruno.}
\label{fig:bruno1}
\end{figure}

Enquanto isso, em paralelo, Ana também faz suas modificações (figura \ref{fig:ana2}).
\begin{figure}
 \centering
 \includegraphics[width=10cm]{ana2.png}
 % ana2.png: 340x60 pixel, 72dpi, 11.99x2.12 cm, bb=0 0 340 60
 \caption{Modificações de Ana.}
\label{fig:ana2}
\end{figure}

Bruno então decide ``puxar'' o repositório de Ana para sincronizá-lo com o seu.
\begin{lstlisting}[language=csh, caption= ,label=]
$`
    hg pull pulling from ssh://maquinadaana/projeto searching for
    changes adding changesets adding manifests adding file changes
    added 1 changesets with 1 changes to 1 files (run 'hg heads' to see
    heads, 'hg merge' to merge)


O comando ``hg pull``, se não especificada a fonte, irá "puxar" da
fonte de onde o repositório local foi clonado. Este comando
atualizará o Arquivo local, mas não o diretório de trabalho.

Após esta operação o repositório de Bruno fica como mostrado na
figura fig:bruno2. Como as mudanças feitas por Ana, foram as
últimas adicionadas ao repositório de Bruno, esta revisão passa a
ser a ponta do Arquivo.



Bruno agora deseja fundir seu ramo de desenvolvimento, com a ponta
do seu Arquivo que corresponde às modificações feitas por Ana.
Normalmente, após puxar modificações, executamos ``hg update`` para
sincronizar nosso diretório de trabalho com o Arquivo recém
atualizado. Então Bruno faz isso.

    :math:`$ hg update
this update spans a branch affecting the following files:
 hello.py (resolve)
aborting update spanning branches!
(use 'hg merge' to merge across branches or 'hg update -C' to lose changes)
\end{lstlisting}

Devido à ramificação no Arquivo de Bruno, o comando \texttt{update} não sabe a que ramo fundir as modificações existentes no diretório de trabalho de Bruno. Para resolver isto, Bruno precisará fundir os dois ramos. Felizmente esta é uma tarefa trivial.
\begin{lstlisting}[language=csh, caption= ,label=]
$`
    hg merge tip merging hello.py


No comando ``merge``, se nenhuma revisão é especificada, o
diretório de trabalho é cabeça de um ramo e existe apenas uma outra
cabeça, as duas cabeças serão fundidas. Caso contrário uma revisão
deve ser especificada.

Pronto! agora o repositório de Bruno ficou como a figura
fig:bruno3.



Agora, se Ana puxar de Bruno, receberá todas as moficações de Bruno
e seus repositórios estarão plenamente sincronizados, como a figura
fig:bruno3. {Criando um Repositório}

Para criar um repositório do zero, é preciso apenas um comando:

    hg init


Quando o diretório é criado, um diretório chamado ``.hg`` é criado
dentro do diretório de trabalho. O ``Mercurial`` irá armazenar
todas as informações sobre o repositório no diretório ``.hg``. O
conteúdo deste diretório não deve ser alterado pelo usuário.

Para saber mais
~~~~~~~~~~~~~~~

Naturalmente, muitas outras coisas podem ser feitas com um sistema
de controle de versões. O leitor é encorajado a consultar a
documentação do ``Mercurial`` para descobrí-las. Para servir de
referência rápida, use o comando ``hg help -v <comando>`` com
qualquer comando da lista abaixo.

    [``add``] Adiciona o(s) arquivo(s) especificado(s) no próximo
    commit.

    [``addremove``] Adiciona todos os arquivos novos, removendo os
    faltantes.

    [``annotate``] Mostra informação sobre modificações por linha de
    arquivo.

    [``archive``] Cria um arquivo (compactado) não versionado, de uma
    revisão especificada.

    [``backout``] Reverte os efeitos de uma modificação anterior.

    [``branch``] Altera ou mostra o nome do ramo atual.

    [``branches``] Lista todas os ramos do repositório.

    [``bundle``] Cria um arquivo compactado contendo todas as
    modificações não presentes em um outro repositório.

    [``cat``] Retorna o arquivo especificado, na forma em que ele era
    em dada revisão.

    [``clone``] Replica um repositório.

    [``commit``] Arquiva todas as modificações ou os arquivos
    especificados.

    [``copy``] Copia os arquivos especificados, para outro diretório no
    próximo ``commit``.

    [``diff``] Mostra diferenças entre revisões ou entre os arquivos
    especificados.

    [``export``] Imprime o cabeçalho e as diferenças para um ou mais
    conjuntos de modificações.

    [``grep``] Busca por palavras em arquivos e revisões específicas.

    [``heads``] Mostra cabeças atuais.

    [``help``] Mostra ajuda para um comando, extensão ou lista de
    comandos.

    [``identify``] Imprime informações sobre a cópia de trabalho
    atual.

    [``import``] Importa um conjunto ordenado de atualizações
    (patches). Este comando é a contrapartida de Export.

    [``incoming``] Mostra novos conjuntos de modificações existentes em
    um dado repositório.

    [``init``] Cria um novo repositório no diretório especificado. Se o
    diretório não existir, ele será criado.

    [``locate``] Localiza arquivos.

    [``log``] Mostra histórico de revisões para o repositório como um
    todo ou para alguns arquivos.

    [``manifest``] Retorna o manifesto (lista de arquivos controlados)
    da revisão atual ou outra.

    [``merge``] Funde o diretório de trabalho com outra revisão.

    [``outgoing``] Mostra conjunto de modificações não presentes no
    repositório de destino.

    [``parents``] Mostra os "pais" do diretório de trabalho ou
    revisão.

    [``paths``] Mostra definição de nomes simbólicos de caminho.

    [``pull``] "Puxa" atualizações da fonte especificada.

    [``push``] Envia modificações para o repositório destino
    especificado. É a contra-partida de ``pull``.

    [``recover``] Desfaz uma transação interrompida.

    [``remove``] Remove os arquivos especificados no próximo commit.

    [``rename``] Renomeia arquivos; Equivalente a ``copy + remove``.

    [``revert``] Reverte arquivos ao estado em que estavam em uma dada
    revisão.

    [``rollback``] Desfaz a última transação neste repositório.

    [``root``] Imprime a raiz do diretório de trabalho corrente.

    [``serve``] Exporta o diretório via HTTP.

    [``showconfig``] Mostra a configuração combinada de todos os
    arquivos ``hgrc``.

    [``status``] Mostra arquivos modificados no diretório de trabalho.

    [``tag``] Adiciona um marcador para a revisão corrente ou outra.

    [``tags``] Lista marcadores do repositório.

    [``tip``] Mostra a revisão "ponta".

    [``unbundle``] Aplica um arquivo de modificações.

    [``update``] Atualiza ou funde o diretório de trabalho.

    [``verify``] Verifica a integridade do repositório.

    [``version``] Retorna versão e informação de copyright.


.. [1]  http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Easymacs/

.. [2]  http://www.selenic.com/mercurial

.. [3] 
   Doravante grafado com "A" maiúsculo para diferenciar de arquivos
   comuns(files).

.. [4] 
   Vou adotar o uso da palavra commit para me referir a esta operação
   daqui em diante. Optei por não tentar uma tradução pois este termo
   é um jargão dos sistemas de controle de versão.

.. [5] 
   Assumimos aqui que a máquina da ana está executando um servidor
   ``ssh``


