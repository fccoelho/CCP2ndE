{Interação com Bancos de Dados}{bancos de dados}
{Apresentação dos módulos de armazenamento de dados Pickle e Sqlite3 que fazem parte da distribuição padrão do Python. Apresentação do pacote SQLObject para comunicação com os principais sistemas de bancos de dados existentes. \\textbf{Pré-requisitos:} Conhecimentos básicos de bancos de dados e SQL.}

{O} gerenciamento de dados não se constitui numa disciplina
científica *per se*. Entretanto, cada vez mais, permeia as
atividades básicas de trabalho científico. O volume crescente de
dados e o aumento de sua complexidade há muito ultrapassou a
capacidade de gerenciamento através de simples planilhas.

Atualmente, é muito comum a necessidade de se armazenar dados
quantitativos, qualitativos e mídias dos mais diferentes
formatos(imagens, vídeos, sons) em uma plataforma integrada de onde
possam ser facilmente acessados para fins de análise, visualizacão
ou simplesmente consulta.

A linguagem Python dispõe de soluções simples para resolver esta
necessidade em seus mais distintos níveis de sofisticação. Seguindo
a filosofia de "baterias incluídas" do Python, a sua biblioteca
padrão nos apresenta o módulo Pickle e cPickle e, a partir da
versão 2.5, o banco de dados relacional sqlite3.

O Módulo Pickle
===============

{pickle} O módulo ``pickle`` e seu primo mais veloz ``cPickle``,
implementam algoritmos que permitem armazenar, em um arquivo,
objetos implementados em Python.

    In [1]:import pickle In [2]:class oi: .2.: def digaoi(self): .2.:
    print "oi" In [3]:a= oi() In [4]:f = open('picteste','w') In
    [5]:pickle.dump(a,f) In [6]:f.close() In [7]:f =
    open('picteste','r') In [8]:b=pickle.load(f) In [9]:b.digaoi() oi


Como vemos na listagem ex:pickle, com o módulo pickle podemos
armazenar objetos em um arquivo, e recuperá-lo sem problemas para
uso posterior. Contudo, uma característica importante deste módulo
não fica evidente no exemplo ex:pickle. Quando um objeto é
armazenado por meio do módulo ``pickle``, nem o código da classe,
nem seus dados, são incluidos, apenas os dados da instância.

    In [10]:class oi: .10.: def digaoi(self,nome='flavio'): .10.: print
    'oi

    In [11]:f = open('picteste','r') In [12]:b=pickle.load(f) In
    [13]:b.digaoi() oi flavio!


Desta forma, podemos modificar a classe, e a instância armazenada
reconhecerá o novo código ao ser restaurada a partir do arquivo,
como podemos ver acima. Esta característica significa que os
``pickles`` não se tornam obsoletos quando o código em que foram
baseados é atualizado (naturalmente isto vale apenas para
modificações que não removam atributos já incluídos nos
``pickles``).

O módulo ``pickle`` não foi construído para armazenamento de dados,
pura e simplesmente, mas de objetos computacionais complexos, que
podem conter em si, dados. Apesar desta versatilidade, peca por
consistir em uma estrutura de armazenamento legível apenas pelo
próprio módulo ``pickle`` em um programa Python.
{O módulo Sqlite3}{sqlite} Este módulo passa a integrar a
biblioteca padrão do Python a partir da versão 2.5. Portanto, passa
a ser uma excelente alternativa para usuários que requerem a
funcionalidade de um banco de dados relacional compatível com
``SQL`` [1]_.

O Sqlite nasceu de uma biblioteca em ``C`` que disponibilizava um
banco de dados extremamente leve e que dispensa o conceito
"servidor-cliente". No ``sqlite``, o banco de dados é um arquivo
manipulado através da biblioteca ``sqlite``.

Para utilizar o sqlite em um programa Python, precisamos importar o
módulo ``sqlite3``.

    In [1]:import sqlite3


O próximo passo é a criação de um objeto "conexão", através do qual
podemos executar comandos SQL.

    In [2]:c = sqlite3.connect('/tmp/exemplo')


Agora dispomos de um banco de dados vazio, consistindo no arquivo
``exemplo``, localizado no diretório ``/tmp``. O ``sqlite`` também
permite a criação de bancos de dados em RAM; para isso basta
substituir o nome do arquivo pela string ````:memory:''``. Para
podermos inserir dados neste banco, precisamos primeiro criar uma
tabela.

    In [3]:c.execute('''create table especimes(nome text, altura real,
    peso real)''') Out[3]:sqlite3.Cursor object at 0x83fed10


Note que os comandos ``SQL`` são enviados como strings através do
objeto ``Connection``, método ``execute``. O comando
``create table`` cria uma tabela; ele deve ser necessáriamente
seguido do nome da tabela e de uma lista de variáveis tipadas(entre
parênteses), correspondendo às variáveis contidas nesta tabela.
Este comando cria apenas a estrutura da tabela. Cada variável
especificada corresponderá a uma coluna da tabela. Cada registro,
inserido subsequentemente, formará uma linha da tabela.

    In [4]:c.execute('''insert into especimes
    values('tom',12.5,2.3)'''


O comando ``insert`` é mais um comando ``SQL`` útil para inserir
registros em uma tabela.

Apesar dos comandos ``SQL`` serem enviados como strings através da
conexão, não se recomenda, por questão de segurança, utilizar os
métodos de formatação de strings ({'...values(%s,%s)'%(1,2)}) do
Python. Ao invés, deve-se fazer o seguinte:

    In [5]:t = ('tom',) In [6]:c.execute('select \* from especimes
    where nome=?',t) In [7]:c.fetchall() [('tom', 12.5,
    2.2999999999999998)]


No exemplo acima utilizamos o método ``fetchall`` para recuperar o
resultado da operação. Caso desejássemos obter um único registro,
usaríamos ``fetchone``.

Abaixo, vemos como inserir mais de um registro a partir de
estruturas de dados existentes. Neste caso, trata-se de repetir a
operação descrita no exemplo anterior, com uma sequência de tuplas
representando a sequência de registros que se deseja inserir.

    In [8]:t = (('jerry',5.1,0.2),('butch',42.4,10.3)) In [9]:for i in
    t: .9.: c.execute('insert into especimes values(?,?,?)',i)


O objeto ``cursor`` também pode ser utilizado como um iterador para
obter o resultado de uma consulta.

    In [10]:c.execute('select \* from especimes by peso') In [11]: for
    reg in c: print reg ('jerry',5.1,0.2) ('tom', 12.5,
    2.2999999999999998) ('butch',42.4,10.3)


O módulo sqlite é realmente versátil e útil, porém, requer que o
usuário conheça, pelo menos, os rudimentos da linguagem ``SQL``. A
solução apresentada a seguir procura resolver este problema de uma
forma mais "pitônica".

O Pacote SQLObject
==================

{SQLObject} O pacote SQLObject [2]_ estende as soluções
apresentadas até agora de duas maneiras: oferece uma interface
orientada a objetos para bancos de dados relacionais e, também, nos
permite interagir com diversos bancos de dados sem ter que alterar
nosso código.

Para exemplificar o ``sqlobject``, continuaremos utilizando o
``sqlite`` devido à sua praticidade.

Construindo um aranha digital
-----------------------------

{aranha}{web-spider} {Módulos!BeautifulSoup} Neste exemplo, teremos
a oportunidade de construir uma aranha digital que recolherá
informações da web (Wikipedia [3]_) e as armazenará em um banco
sqlite via sqlobject.

Para este exemplo, precisaremos de algumas ferramentas que vão além
do banco de dados. Vamos explorar a capacidade da biblioteca padrão
do Python para interagir com a internet, e vamos nos utilizar de um
pacote externo para decodificar as páginas obtidas.
[linerange={1-6},frame=trBL, caption=Módulos necessários, label=ex:arimp] {code/aranha.py}

O pacote ``BeautifulSoup`` [4]_ é um "destrinchador" de páginas da
web. Um dos problemas mais comuns ao se lidar com páginas html, é
que muitas delas possuem pequenos defeitos em sua construção que
nossos navegadores ignoram, mas que podem atrapalhar uma análise
mais minuciosa. Daí o valor do ``BeautifulSoup``; ele é capaz de
lidar com páginas defeituosas, retornando uma estrutura de dados
com métodos que permitem uma rápida e simples extração da
informação que se deseja. Além disso, se a página foi criada com
outra codificação, o ``BeautifulSoup``, retorna todo o conteúdo em
Unicode, automaticamente, sem necessidade de intervenção do
usuário.

Da biblioteca padrão, vamos nos servir dos módulos
``sys, os, urllib, urllib2`` e ``re``. A utilidade de cada um
ficará clara à medida que avançarmos no exemplo.

O primeiro passo é especificar o banco de dados. O sqlobject nos
permite escolher entre ``MySQL``, ``PostgreSQL``, ``sqlite``,
``Firebird``, ``MAXDB``, ``Sybase``, ``MSSQL``, ou ``ADODBAPI``.
Entretanto, conforme já explicamos, nos restringiremos ao uso do
banco ``sqlite``.
[linerange={8-11},frame=trBL, caption=Especificando o banco de dados., label=ex:arbdset] {code/aranha.py}

Na listagem ex:arbdset, criamos o diretório(``os.mkdir``) onde o
banco de dados residirá (se necessário) e definimos a conexão com o
banco. Utilizamos ``os.path.exists`` para verificar se o diretório
existe. Como desejamos que o diretório fique na pasta do usuário, e
não temos como saber, de antemão, qual é este diretório, utilizamos
``os.path.expanduser`` para substituir o {\\~} por
``/home/usuario`` como aconteceria no console unix normalmente.

Na linha 11 da listagem ex:arbdset, vemos o comando que cria a
conexão a ser utilizada por todos os objetos criados neste módulo.

Em seguida, passamos a especificar a tabela do nosso banco de dados
como se fora uma classe, na qual seus atributos são as colunas da
tabela.
[linerange={16-20},frame=trBL, caption=Especificando a tabela \\texttt{ideia} do banco de dados., label=ex:arsql] {code/aranha.py}

A classe que representa nossa tabela é herdeira da classe
``SQLObject``. Nesta classe, a cada atributo (coluna da tabela)
deve ser atribuido um objeto que define o tipo de dados a ser
armazenado. Neste exemplo, vemos quatro tipos distintos, mas
existem vários outros. ``UnicodeCol`` representa textos codificados
como Unicode, ou seja, podendo conter caracteres de qualquer
língua. ``IntCol`` corresponde a números inteiros. ``PickleCol`` é
um tipo muito interessante pois permite armazenar qualquer tipo de
objeto Python. O mais interessante deste tipo de coluna, é que não
requer que o usuário invoque o módulo pickle para armazernar ou ler
este tipo de variável, As variáveis são convertidas/reconvertidas
automaticamente, de acordo com a operação. Por fim, temos
``StringCol`` que é uma versão mais simples de ``UnicodeCol``,
aceitando apenas strings de caracteres ``ascii``. Em ``SQL`` é
comum termos que especificar diferentes tipos, de acordo com o
comprimento do texto que se deseja armazenar em uma variável. No
``sqlobject``, não há limite para o tamanho do texto que se pode
armazenar tanto em ``StringCol`` quanto em ``UnicodeCol``

A funcionalidade da nossa aranha foi dividida em duas classes:
``Crawler``, que é o rastejador propriamente dito, e a classe
``UrlFac`` que constrói as urls a partir da palavra que se deseja
buscar na Wikipedia.

Cada página é puxada pelo módulo ``urllib2``. A função
``urlencode`` do módulo urllib, facilita a adição de dados ao nosso
pedido, de forma a não deixar transparecer que este provém de uma
aranha digital. Sem este disfarce, a Wikipedia recusa a
conexão.{urllib2}{urllib}

A páginas são então analisadas pelo método ``verResp``, no qual o
``BeautifulSoup`` tem a chance de fazer o seu trabalho. Usando a
função ``SoupStrainer``, podemos filtrar o resto do documento, que
não nos interessa, analizando apenas os links (tags 'a') cujo
destino são urls começadas pela string {/wiki/}. Todos os artigos
da wikipedia, começam desta forma. Assim, evitamos perseguir links
externos. A partir da "sopa" produzida, extraímos apenas as urls,
ou seja, o que vem depois de ``href=``. Podemos ver na listagem
ex:arresto que fazemos toda esta filtragem sofisticada em duas
linhas de código(55 e 56), graças ao ``BeautifulSoup``.
[linerange={15-107},frame=trBL, caption=Restante do código da aranha., label=ex:arresto] {code/aranha.py}

A listagem ex:arresto mostra o restante do código da aranha e o
leitor poderá explorar outras solução implementadas para otimizar o
trabalho da aranha. Note que não estamos guardando o html completo
das páginas para minimizar o espaço de armazenamento, mas este
programa pode ser modificado facilmente de forma a reter todo o
conteúdo dos artigos.

Exercícios
==========


#.
   Modifique a aranha apresentada neste capítulo, para guardar os
   documentos varridos.

#.
   Crie uma classe capaz de conter os vários aspectos (links, figuras,
   etc) de um artigo da wikipedia, e utilize a aranha para criar
   instâncias desta classe para cada artigo encontrado, a partir de
   uma única palavra chave. Dica: para simplificar a persistência,
   armazene o objeto artigo como um Pickle, no banco de dados.


.. [1] 
   SQL significa "Structured Query Language". o ``SQL`` é um padrão
   internacional na interação com bancos de dados relacionais. Para
   saber mais, consulte http://pt.wikipedia.org/wiki/SQL

.. [2]  http://www.sqlobject.org/

.. [3]  http://pt.wikipedia.org

.. [4]  http://www.crummy.com/software/BeautifulSoup/


