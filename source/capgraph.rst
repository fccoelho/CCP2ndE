.. role:: math(raw)
   :format: html latex

{Teoria de Grafos} {Grafos}
{Breve introdução a teoria de grafos e sua representação computacional. Introdução ao Pacote \\texttt{NetworkX}, voltado para a manipulação de grafos.
\\textbf{Pré-requisitos:} Programação orientada a objetos.}

Introdução
==========

A teoria de grafos é uma disciplina da matemática cujo objeto de
estudo se presta, muito bem, a uma representação computacional como
um objeto. Matematicamente, um grafo é definido por um conjunto
finito de vértices (:math:`$V$`) e por um segundo conjunto
(:math:`$A$`) de relações entre estes vértices, denominadas
arestas. Grafos tem aplicações muito variadas, por exemplo: uma
árvore genealógica é um grafo onde as pessoas são os vértices e
suas relações de parentesco são as arestas do grafo.

Um grafo pode ser definido de forma não ambígua, por sua lista de
arestas (:math:`$A$`), que implica no conjunto de vértices que
compõem o grafo. Grafos podem ser descritos ou mensurados através
de um conjunto de propriedades:


-  Grafos podem ser *direcionados* ou não;

-  A *ordem* de um grafo corresponde ao seu número de vértices;

-  O *tamanho* de um grafo corresponde ao seu número de arestas;

- 
   Vértices, conectados por uma aresta, são ditos *vizinhos* ou
   *adjacentes*;

-  A *ordem* de um vértice corresponde ao seu número de vizinhos;

-  Um *caminho* é uma lista de arestas que conectam dois vértices;

-  Um *ciclo* é um caminho que começa e termina no mesmo vértice;

-  Um grafo sem ciclos é denominado *acíclico*.


A lista acima não exaure as propriedades dos grafos, mas é
suficiente para esta introdução.

Podemos representar um grafo como um objeto Python de várias
maneiras, dependendo de como desejamos utilizá-lo. A forma mais
trivial de representação de um grafo em Python seria feita
utilizando-se um dicionário. A Listagem ex:grafdict mostra um
dicionário representando o grafo da figura fig:g1. Neste
dicionário, utilizamos como chaves os vértices do grafo associados
a suas respectivas listas de vizinhos. Como tudo em Python é um
objeto, poderíamos já nos aproveitar dos métodos de dicionário para
analisar nosso grafo (Listagem ex:vlist).

    g =
    'a':['c','d','e'],'b':['d','e'],'c':['a','d'],'d':['b','c','a'],'e':['a','b']




Podemos utilizar o método ``keys`` para obter uma lista dos
vértices de nosso grafo.

    g.keys() ['a', 'c', 'b', 'e', 'd']


Uma extensão do conceito de grafos é o conceito de redes. Redes são
grafos nos quais valores numéricos são associados às suas arestas.
Redes herdam as propriedade dos grafos e possuem algumas
propriedades específicas.

A representação de redes, a partir de objetos pitônicos simples,
como um dicionário, também é possivel. Porém, para dar mais alcance
aos nossos exemplos sobre teoria de grafos, vamos nos utilizar do
pacote ``NetworkX`` [1]_ que já implementa uma representação
bastante completa de grafos e redes em Python.

NetworkX
========

{NetworkX} O pacote ``NetworkX`` se presta à criação, manipulação e
estudo da estrutura, dinâmica e funções de redes complexas.

A criação de um objeto grafo a partir de seu conjunto de arestas,
:math:`$A$`, é muito simples. Seja um grafo :math:`$G$` com
vértices :math:`$V=\left\lbrace W,X,Y,Z\right\rbrace $`:
:math:`$$`G:A= (W,Z),(Z,Y),(Y,X),(X,Z) :math:`$$`
[frame=trBL,caption=Definindo um grafo através de seus vértices,label=ex:graph1] {code/graph1.py}
Executando o código acima, obtemos: :math:`$$`['Y', 'X', 'Z', 'W']
[('Y', 'X'), ('Y', 'Z'), ('X', 'Z'), ('Z', 'W')]:math:`$$`

Ao lidar com grafos, é conveniente representá-los graficamente.
Vejamos como obter o diagrama do grafo da listagem ex:graph1:
[frame=trBL,caption=Diagrama de um grafo,label=ex:graph2] {code/graph2.py}

A funcionalidade do pacote ``NetworkX`` é bastante ampla. A seguir
exploraremos um pouco desta funcionalidade.



Construindo Grafos
------------------

O ``NetworkX`` oferece diferentes classes de grafos, dependendo do
tipo de aplicação que desejada. Abaixo, temos uma lista dos
comandos para criar cada tipo de grafo.

    [G=Graph()] Cria um grafo simples e vazio :math:`$G$`.

    [G=DiGraph()] Cria grafo direcionado e vazio :math:`$G$`.

    [G=XGraph()] Cria uma rede vazia, ou seja, com arestas que podem
    receber dados.

    [G=XDiGraph()] Cria uma rede direcionada.

    [G=empty\_graph(n)] Cria um grafo vazio com n vértices.

    [G=empty\_graph(n,create\_using=DiGraph())] Cria um grafo
    direcionado vazio com n vértices.

    [G=create\_empty\_copy(H)] Cria um novo grafo vazio do mesmo tipo
    que H.


Manipulando Grafos
------------------

Uma vez de posse de um objeto grafo instanciado a partir de uma das
classes listadas anteriormente, é de interesse poder manipulá-lo de
várias formas. O próprio objeto dispõe de métodos para este fim:

G.add\_node(n)
    Adiciona um único vértice a G.

    [G.add\_nodes\_from(lista)] Adiciona uma lista de vértices a G.

    [G.delete\_node(n)]Remove o vértice ``n`` de G.

    [G.delete\_nodes\_from(lista)] Remove uma lista de vértices de G.

    [G.add\_edge(u,v)]Adiciona a aresta ``(u,v)`` a G. Se G for um
    grafo direcionado, adiciona uma aresta direcionada
    :math:`$u\longrightarrow v$`. Equivalente a
    {G.add\\\_edge((u,v))}.

    [G.add\_edges\_from(lista)]Adiciona uma lista de arestas a G.

    [G.delete\_edge(u,v)]Remove a aresta ``(u,v)``.

    [G.delete\_edges\_from(lista)]Remove uma lista de arestas de G.

    [G.add\_path(listadevertices)]Adiciona vértices e arestas de forma
    a compor um caminho ordenado.

    [G.add\_cycle(listadevertices)]O mesmo que {add\\\_path}, exceto
    que o primeiro e o último vértice são conectados, formando um
    ciclo.

    [G.clear()]Remove todos os vértices e arestas de G.

    [G.copy()]Retorna uma cópia "rasa" do grafo G. [2]_

    [G.subgraph(listadevertices)]Retorna subgrafo correspondente à
    lista de vértices.


Criando Grafos a Partir de Outros Grafos
----------------------------------------

subgraph(G, listadevertices)
    Retorna subgrafo de G correspondente à lista de vértices.

    [union(G1,G2)]União de grafos.

    [disjoint\_union(G1,G2)]União disjunta, ou seja, assumindo que
    todos os vértices são diferentes.

    [cartesian\_product(G1,G2)]Produto cartesiano de dois grafos
    (Figura fig:gpcc).

    [compose(G1,G2)]Combina grafos, identificando vértices com mesmo
    nome.

    [complement(G)]Retorna o complemento do grafo(Figura fig:gpcc).

    [create\_empty\_copy(G)]Cópia vazia de G.

    [convert\_to\_undirected(G)]Retorna uma cópia não direcionada de
    G.

    [convert\_to\_directed(G)]Retorna uma cópia não direcionada de G.

    [convert\_node\_labels\_to\_integers(G)]Retorna uma cópia com os
    vértices renomeados como números inteiros.




Gerando um Grafo Dinamicamente
------------------------------

Muitas vezes, a topologia da associação entre componentes de um
sistema complexo não está dada a priori. Frequentemente, esta
estrutura é dada pela própria dinâmica do sistema.

No exemplo que se segue, simulamos um processo de contágio entre os
elementos de um conjunto de vértices, observando ao final, a
estrutura produzida pelo contágio.
[frame=trBL,caption=Construindo um grafo dinamicamente,label=ex:cont] {code/grafodin.py}

    {Módulo threading:} Permite executar mais de uma parte do programa
    em paralelo, em um "fio" de execução independente. Este fios,
    compartilham todas as variáveis globais e qualquer alteração nestas
    é imediatamente visível a todos os outros fios.


{Módulos!threading}

O objeto grafo do ``NetworkX`` aceita qualquer objeto como um
vértice. Na listagem ex:cont, nos valemos deste fato para colocar
instâncias da classe ``Contagio`` como vértices do grafo
:math:`$G$`. O grafo G é contruído somente por vértices
(desconectado). Então infectamos um vértice do grafo, chamando o
seu método ``contraiu()``. O vértice, após declarar-se doente e
incrementar o contador de doentes a nível do grafo, chama o método
``transmite()``.

O método ``transmite`` assume que durante seu período infeccioso,
cada vértice tem contatos efetivos com apenas dez outros vértices.
Então cada vértice irá transmitir para cada um destes, desde que
não estejam já doentes.

Cada vértice infectado inicia o método ``contraiu`` em um "thread"
separado. Isto significa que cada vértice sai infectando os
restantes, em paralelo. Na verdade, como o interpretador Python só
executa uma instrução por vez, cada um destes objetos recebe do
interpretador uma fatia de tempo por vez, para executar suas
tarefas. Pode ser que o tempo de uma destas fatias seja suficiente
para infectar a todos no seu grupo, ou não. Depois que o processo
se desenrola, temos a estrutura do grafo como resultado (Figura
fig:cont)



Construindo um Grafo a Partir de Dados
--------------------------------------

O conceito de grafos e redes é extremamente útil na representação e
análise de sistemas complexos, com muitos componentes que se
relacionam entre si. Um bom exemplo é uma rede social, ou seja, uma
estrutura de interação entre pessoas. Esta interação pode ser
medida de diversas formas. No exemplo que se segue, vamos tentar
inferir a rede social de um indivíduo, por meio de sua caixa de
mensagens.
[frame=trBL,caption=Construindo uma rede social a partir de e-mails,label=ex:mnet] {code/mnet.py}

Na Listagem ex:mnet, usamos dois módulos interessantes da
biblioteca padrão do Python: O módulo ``email`` e o módulo mailbox.
``mailbox``.

    {Módulo email:} Módulo para decodificar, manusear, e compor
    emails.


{Módulos!email}

    {Módulo mailbox:} Conjuto de classes para lidar com caixas de
    correio no formato Unix, MMDF e MH.


{Módulos!mailbox}

Neste exemplo, utilizei a minha mailbox associada com o programa
Kmail; portanto, se você usa este mesmo programa, basta substituir
o diretório de sua mailbox e o programa irá funcionar para você.
Caso use outro tipo de programa de email, consulte a documentaçao
do Python para buscar a forma correta de ler o seu mailbox.

A classe ``Maildir`` retorna um iterador, que por sua vez,
retornará mensagens decodificadas pela função msgfactory, definida
por nós. Esta função se utiliza do módulo email para decodificar a
mensagem.

Cada mensagem recebida é processada para gerar um grafo do tipo
"estrela", com o remetente no centro e todos os destinatários da
mensagem nas pontas. Este grafo é então adicionado ao grafo
original, na forma de uma lista de arestas. Depois de todas as
mensagens terem sido assim processadas, geramos a visualização do
grafo (Figura fig:mnet).



Exercícios
==========


#.
   Determine o conjunto de arestas :math:`$A$` que maximiza o tamanho
   do grafo cujos vértices são dados por :math:`$V=\{a,b,c,d,e\}$`.

#.
   No exemplo do contágio, verifique se existe alguma relação entre o
   tamanho da amostra de cada vértice e a densidade final do grafo.

#.
   Ainda no exemplo do contágio, refaça o experimento com um grafo de
   topologia dada a priori no qual os vértices só podem infectar seus
   vizinhos.

#.
   Insira um print no laço for do exemplo ex:mnet para ver o formato
   de saída do iterador mbox.

#.
   Modifique o programa ex:mnet para associar apenas mensagens que
   contêm uma palavra em comum.


.. [1]  https://networkx.lanl.gov/

.. [2] 
   Uma cópia rasa significa que se cria um novo objeto grafo
   referenciando o mesmo conteúdo. Ou seja, se algum vértice ou aresta
   for alterado no grafo original, a mudança se reflete no novo
   grafo.


