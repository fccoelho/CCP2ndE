.. role:: math(raw)
   :format: html latex

.. _cap-fundamentos:

************************
Fundamentos da Linguagem
************************

    Breve introdução a conceitos básicos de programação e à linguagem Python. A maioria dos elementos básicos da linguagem são abordados neste capítulo, com exceção de classes, que são discutidas em detalhe no capítulo :ref:`cap-obj`. **Pré-requisitos:** Conhecimentos básicos de programação em qualquer linguagem.

Neste Capítulo, faremos uma breve introdução à linguagem Python. Esta introdução servirá de base para os exemplos dos capítulos subseqüentes. Para uma introdução mais completa à linguagem, recomendamos ao leitor a consulta a livros e outros documentos voltados especificamente para programação em Python.

Primeiras impressões
--------------------

Para uma primeira aproximação à linguagem, vamos examinar suas
características básicas. Façamos isso interativamente, a partir do
console Python. Vejamos como invocá-lo::

    $ python
    Python 2.7.3 (default, Sep 26 2012, 21:51:14)
    [GCC 4.7.2] on linux2
    Type "help", "copyright", "credits" or "license" for more information.
    >>>

.. _ex-conspy:

Toda linguagem, seja ela de programação ou linguagem natural, possui um conjunto de palavras que a caracteriza. As linguagens de programação tendem a ser muito mais compactas do que as linguagens naturais. O Python pode ser considerado uma linguagem compacta, mesmo em comparação com outras linguagens de programação. 

As palavras que compõem uma linguagem de programação são ditas reservadas, ou seja, não podem ser utilizadas para nomear variáveis. Se o programador tentar utilizar uma das palavras reservadas como variável, incorrerá em um erro de sintaxe.
Palavras reservadas não podem ser utilizadas como nomes de variáveis::

    >>> for=1
      File "<stdin>", line 1
        for=1
           ^
    SyntaxError: invalid syntax


A linguagem Python em sua versão atual (2.5), possui 30 palavras reservadas. São elas: *and*, *as*, *assert*, *break*, *class*, *continue*, *def*, *del*, *elif*, *else*, *except*, *exec* *finally*, *for*, *from*, *global*, *if*, *import*, *in*, *is*, *lambda*, *not*, *or*, *pass*, *print*, *raise*, *return*, *try*, *while* e *yield*. Além destas palavras, existem constantes, tipos e funções internas ao Python, que estão disponíveis para a construção de programas. Estes elementos podem ser inspecionados através do comando *dir(__builtins__)*. Nenhum dos elementos do módulo *\_\_builtins\_\_* deve ser redefinido\footnote{Atenção, os componentes de *\_\_builtins\_\_*, não geram erros de sintaxe ao ser redefinidos. 

.. index:: Palavras reservadas

O console interativo do Python possui um sistema de ajuda integrado que pode ser usado para acessar a documentação de qualquer elemento da linguagem. O comando :samp:`help()`, inicia a ajuda interativa. A partir daí, podemos por exemplo, digitar *keywords* para acessar a ajuda das palavras reservadas listadas acima. Se digitarmos *for* em seguida, obteremos a seguinte ajuda::
    7.3 The for statement

    The for statement is used to iterate over the elements of a sequence
    (such as a string, tuple or list) or other iterable object:
    ...



Uso Interativo *vs.* Execução a Partir de Scripts
-------------------------------------------------

Usuários familiarizados com ambientes de programação científicos tais como Matlab, R e similares, ficarão satisfeitos em saber que o Python também pode ser utilizado de forma interativa. Para isso, basta invocar o interpretador na linha de comando (Python shell, em Unix) ou invocar um shell mais sofisticado como o Idle, que vem com a distribuição padrão do Python, ou o Ipython (ver :ref:`sec_ipython`).

.. index:: Uso interativo,

Tanto no uso interativo, como na execução a partir de scripts, o interpretador espera encontrar apenas uma expressão por linha do programa. Caso se deseje inserir mais de uma expressão em uma linha, as expressões devem ser separadas por :samp:`;`. Mas esta prática deve ser evitada. Expressões podem continuar em outra linha se algum de seus parênteses, colchetes, chaves ou aspas ainda não tiver sido fechado. Alternativamente, linhas podem ser quebradas pela aposição do caractere :samp:`\\` ao final da linha::

    >>> 1+1
    2
    >>>

.. _ex-calc:

No cabeçalho da shell do Python, acima (listagem :ref:`ex-conspy`), o interpretador identifica a versão instalada, data e hora em que foi compilada, o compilador C utilizado, detalhes sobre o sistema operacional e uma linhazinha de ajuda para situar o novato.

Para executar um programa, a maneira usual (em Unix) é digitar: *python script.py*. No Windows basta um duplo clique sobre arquivos com extensão *.py*.


No Linux e em vários UNIXes, podemos criar scripts que são
executáveis diretamente, sem precisar invocar o interpretador
antes. Para isso, basta incluir a seguinte linha no topo do nosso
script::

    #!/usr/bin/env python


Note que os caracteres :samp:`\\#!` devem ser os dois primeiros
caracteres do arquivo (como na listagem ex-exec)::

    #!/usr/bin/env python

    print "Alô Mundo!"


Depois, resta apenas ajustar as permissões do arquivo para que
possamos executá-lo::

    $ chmod +x script.py
    $ ./script.py sys:1:
    DeprecationWarning: Non-ASCII character '4' in file ./teste on line
    3, but no encoding declared; see
    http://www.python.org/peps/pep-0263.html for details Alô Mundo!


Mas que lixo é aquele antes do nosso "**Alô mundo**"? Trata-se do
interpretador reclamando do acento circunflexo em "**Alô**". Para
que o Python não reclame de acentos e outros caracteres da língua
portuguesa não contidos na tabela ASCII, precisamos adicionar a
seguinte linha ao script: :samp:`# -\*- coding: latin-1 -\*-`.
Experimente editar o script acima e veja o resultado.

.. note::
    Aqui assume-se que a codificação do seu editor de texto é :samp:`latin1`. O
    importante e casar a codificação do seu editor de texto com a especificada
    no início do seu script.

No exemplo da listagem ex-exec, utilizamos o comando ``print`` para
fazer com que nosso script produzisse uma string como saída, ou
seja, para escrever no stdout [1]_. Como podemos receber
informações pelo ``stdin``? O Python nos oferece duas funções para
isso: ``input('texto')``, que executa o que o usuário digitar,
sendo portanto perigoso, e ``raw_input('texto')``, que retorna uma
string com a resposta do usuário.

Nas listagens que se seguem, alternaremos entre a utilização de scripts e a utilização do Python no modo interativo. A presença do símbolo ``>>>``, característico da shell do Python será suficiente para diferenciar os dois casos. Exemplos de scripts virão dentro de caixas.

Operações com Números
---------------------

Noventa e nove por cento das aplicações científicas envolvem algum
tipo de processamento numérico. Vamos iniciar nosso contato com o
Python através dos números::

    >>> 2+2 #Comentário ...
    4  
    >>> 2*2 
    4 
    >>> 2**2
    4
    >>> (50-5*6)/4 #Divisão de inteiros retorna "floor": ...
    5  
    >>> 7/3 
    2 
    >>> 7/-3
    -3 
    >>> 7/3. 
    2.3333333333333335

Operadores aritméticos
""""""""""""""""""""""
Nosso primeiro exemplo numérico (Listagem ex-arit) [2]_, trata números em sua representação mais simples: como constantes. É desta forma que utilizamos uma calculadora comum. Em programação é mais comum termos números associados a quantidades, a que precisamos nos referenciar e que podem se modificar. Esta representação de números chama-se variável.

O sinal de ``=`` é utilizado para atribuir valores a variáveis::

    >>> largura = 20 
    >>> altura = 5*9 
    >>> largura * altura 
    900


Um valor pode ser atribuído a diversas variáveis com uma única operação de atribuição, ou múltiplos valores a múltiplas variáveis (Listagem ex-multatr). Note que no exemplo de atribuição de múltiplos valores a múltiplas variáveis (Listagem ex-multatr, linha 9) os valores poderiam estar em uma tupla::

    >>> x = y = z = 0  
    >>> x 
    0 
    >>> y 
    0 
    >>> z 
    0 
    >>> a,b,c=1,2,3
    >>> a 
    1 
    >>> b 
    2 
    >>> c 
    3


O Python também reconhece números reais (ponto-flutuante) e complexos naturalmente. Em operações entre números reais e inteiros o resultado será sempre real. Da mesma forma, operações entre números reais e complexos resultam sempre em um número complexo. Números complexos são sempre representados por dois números ponto-flutuante: a parte real e a parte imaginária. A parte imaginária é representada com um sufixo "j" ou "J"::

    >>> 1j * 1J 
    (-1+0j) 
    >>> 1j * complex(0,1) 
    (-1+0j) 
    >>> 3+1j*3 
    (3+3j)
    >>> (3+1j)\*3 
    (9+3j) 
    >>> (1+2j)/(1+1j) 
    (1.5+0.5j)


Números complexos
"""""""""""""""""

Um Número complexo para o Python, é um
objeto [3]_. Podemos extrair as partes componentes de um número complexo ``c`` utilizando atributos do tipo complexo: ``c.real`` e ``c.imag``. A função ``abs``, que retorna o módulo de um numero inteiro ou real, retorna o comprimento do vetor no plano complexo, quando aplicada a um número complexo. O módulo de um número complexo é também denominado magnitude::

    >>> a=3.0+3.0j
    >>> a.real 
    3.0 
    >>> a.imag 
    3.0 
    >>> abs(a)
    4.2426406871192848
    >>> sqrt(a.real**2 + a.imag**2) 
    4.2426406871192848

Nomes, Objetos e Espaços de Nomes
=================================

{espaço de nomes} Nomes em Python são identificadores de objetos, e também são chamados de variáveis. Nomes devem ser iniciados por letras maiúsculas ou minúsculas e podem conter algarismos, desde que não sejam o primeiro caractere. O Python faz distinção entre maiúsculas e minúsculas portanto, ``nome != Nome``.

No Python, todos os dados são objetos tipados, que são associados dinamicamente a nomes. O sinal de igual (``=``), liga o resultado da avaliação da expressão do seu lado direito a um nome situado à sua esquerda. A esta operação damos o nome de atribuição::

    >>> a=3*2**7 
    >>> a,b = ('laranja','banana')


As variáveis criadas por atribuição ficam guardadas na memória do computador. Para evitar preenchimento total da memória, assim que um objeto deixa de ser referenciado por um nome (deixa de existir no espaço de nomes corrente), ele é imediatamente apagado da memória pelo interpretador.

O conceito de espaço de nomes é uma característica da linguagem Python que contribui para sua robustez e eficiência. Espaços de nomes são dicionários (ver ss:dict) contendo as variáveis, objetos e funções disponíveis durante a execução de um programa. A um dado ponto da execução de um programa, existem sempre dois dicionários disponíveis para a resolução de nomes: um local e um global. Estes dicionários podem ser acessados para leitura através das funções ``locals()`` e ``globals()``, respectivamente. Sempre que o interpretador Python encontra uma palavra que não pertence ao conjunto de palavras reservadas da linguagem, ele a procura, primeiro no espaço de nomes local e depois no global. Se a palavra não é encontrada, um erro do tipo ``NameError`` é acionado::

    >>> maria 
    Traceback (most recent call last): File "stdin", line 1, in ?
    NameError: name 'maria' is not defined


O espaço de nomes local, muda ao longo da execução de um programa. Toda a vez que a execução adentra uma função, o espaço de nomes local passa a refletir apenas as variáveis definidas dentro daquela função [4]_. Ao sair da função, o dicionário local torna-se igual ao global::

    >>> a=1 
    >>> len(globals().items()) 
    4 
    >>> len(locals().items()) 
    4 
    >>> def fun(): 
    ... a='novo valor' 
    ... print len(locals().items()) 
    ... print a 
    ...    
    >>> fun() 
    1 
    novo valor 
    >>> print a 
    1 
    >>> len(locals().items()) 
    5 
    >>> locals()
    'builtins': module 'builtin' (built-in), 'name': 'main', 'fun':
    function fun at 0xb7c18ed4, 'doc': None, 'a': 1


Também é importante lembrar que o espaço de nomes local sempre inclui os ``__builtins__`` como vemos acima.

Estruturas de Dados
===================

Qualquer linguagem de programação pode ser simplisticamente descrita como uma ferramenta, através da qual, dados e algoritmos são implementados e interagem para a solução de um dado problema. Nesta seção vamos conhecer os tipos e estruturas de dados do Python para que possamos, mais adiante, utilizar toda a sua flexibilidade em nossos programas.

No Python, uma grande ênfase é dada à simplicidade e à flexibilidade de forma a maximizar a produtividade do programador. No tocante aos tipos e estruturas de dados, esta filosofia se apresenta na forma de uma tipagem dinâmica, porém forte. Isto quer dizer que os tipos das variáveis não precisam ser declarados pelo programador, como é obrigatório em linguagens de tipagem estática como o C, FORTRAN, Visual Basic, etc. Os tipos das variáveis são inferidos pelo interpretador. As principais estruturas de dados como ``Listas`` e ``Dicionários``, podem ter suas dimensões alteradas, dinamicamente durante a execução do Programa , o que facilita enormemente a vida do programador, como veremos mais adiante. 

Listas
------

.. index:: listas, lista

As listas formam o tipo de dados mais utilizado e versátil do Python. Listas são definidas como uma sequência de valores separados por vírgulas e delimitada por colchetes::

    >>> lista=[1, 'a', 'pe'] 
    >>> lista 
    [1, 'a', 'pe'] 
    >>> lista[0] 
    1 
    >>> lista[2] 
    'pe'
    >>> lista[-1] 
    'pe'


Na listagem :ref:`ex-lista1`, criamos uma lista de três elementos. Uma lista é uma sequência ordenada de elementos, de forma que podemos selecionar elementos de uma lista por meio de sua posição. Note que o primeiro elemento da lista é ``lista[0]``. Todas as contagens em Python começam em ``0``.

Uma lista também pode possuir elementos de tipos diferentes. Na listagem :ref:`ex-lista1`, o elemento ``0`` é um inteiro enquanto que os outros elementos são strings. Para verificar isso, digite o comando ``type(lista[0])``.

Uma característica muito interessante das listas do Python, é que elas podem ser indexadas de trás para frente, ou seja, ``lista[-1]`` é o último elemento da lista. Como listas são sequências de tamanho variável, podemos assessar os últimos **n** elementos, sem ter que contar os elementos da lista.

Listas podem ser "fatiadas", ou seja, podemos selecionar uma porção de uma lista que contenha mais de um elemento::

    >>> lista=['a','pe', 'que', 1] 
    >>> lista[1:3] 
    ['pe', 'que'] 
    >>> lista[-1] 
    1
    >>> lista[3] 
    1


O comando ``lista[1:3]``, delimita uma "fatia" que vai do elemento ``1`` (o segundo elemento) ao elemento imediatamente anterior ao elemento ``3``. Note que esta seleção inclui o elemento correspondente ao limite inferior do intervalo, mas não o limite superior. Isto pode gerar alguma confusão, mas tem suas utilidades. Índices negativos também podem ser utilizados nestas expressões. 

Para retirar uma fatia que inclua o último elemento, temos que usar uma variação deste comando seletor de intervalos::

    >>> lista[2:] 
    ['que', 1]


Este comando significa todos os elementos a partir do elemento ``2`` (o terceiro), até o final da lista. Este comando poderia ser utilizado para selecionar elementos do início da lista: ``lista[:3]``, só que desta vez não incluindo o elemento ``3`` (o quarto elemento).

Se os dois elementos forem deixados de fora, são selecionados todos os elementos da lista::

    >>> lista[:] 
    ['a', 'pe', 'que', 1]


Só que não é a mesma lista, é uma nova lista com os mesmos elementos. Desta forma, ``lista[:]`` é uma maneira de fazer uma cópia completa de uma lista. Normalmente este recurso é utilizado junto com uma atribuição ``a = lista[:]``::

    >>> lista[:] 
    ['a', 'pe', 'que', 1] 
    >>> lista.append(2) #adiciona 2 ao final
    ['a', 'pe', 'que', 1, 2] 
    >>> lista.insert(2,['a','b']) 
    >>> lista 
    ['a', 'pe', ['a', 'b'], 'que', 1, 2]


As listas são conjuntos mutáveis, ao contrário de tuplas e strings, portanto pode-se adicionar(listagem :ref:`ex-adlista`), modificar ou remover (tabela :ref:`tab:metlista`) elementos de uma lista.

.. index::
   single: listas; métodos

Note que as operações *in situ* não alocam memória extra para a operação, ou seja, a inversão ou a ordenação descritas na tabela :ref:`tab:metlista`, são realizadas no mesmo espaço de memória da lista original. Operações *in situ* alteram a variável em si sem fazer uma cópia da mesma e, portanto não retornam nada.

O método ``L.insert`` insere um objeto antes da posição indicada pelo índice. Repare, na listagem ex-adlista, que o objeto em questão era uma lista, e o método insert não a fundiu com a lista original. Este exemplo nos mostra mais um aspecto da versatilidade do objeto lista, que pode ser composto por objetos de qualquer tipo::

    >>> lista2=['a','b'] 
    >>> lista.extend(lista2) 
    >>> lista 
    ['a', 'pe', ['a', 'b'], 'que', 1, 2, 'a', 'b']


Já na listagem :ref:`ex-extlista`, os elementos da segunda lista são adicionados, individualmente, ao final da lista original::

    >>> lista.index('que') 
    3 
    >>> lista.index('a') 
    0 
    >>> lista.index('z') 
    Traceback (most recent call last): 
    File "input", line 1, in ? 
    ValueError: list.index(x): x not in list 'z' in lista 0


Conforme ilustrado na listagem ex-buslista, o método ``L.index`` retorna o índice da primeira ocorrência do valor dado. Se o valor não existir, o interpretador retorna um ``ValueError``. Para testar se um elemento está presente em uma lista, pode-se utilizar o comando ``in`` [5]_ como ilustrado na listagem ex-buslista. Caso o elemento faça parte da lista, este comando retornará ``1``, caso contrário retornará ``0`` [6]_.

Existem dois métodos básicos para remover elementos de uma lista: ``L.remove`` e ``L.pop`` -- listagem :ref:`ex-remlista`. O primeiro remove o elemento nomeado sem nada retornar, o segundo elimina e retorna o último ou o elemento da lista (se chamado sem argumentos), ou o determinado pelo índice, passado como argumento::

    >>> lista.remove("que") 
    >>> lista 
    ['a', 'pe', ['a', 'b'], 1, 2, 'a', 'b']
    >>> lista.pop(2) 
    ['a', 'b'] 
    >>> lista 
    ['a', 'pe', 1, 2, 'a', 'b']


Operadores aritméticos também podem ser utilizados para operações com listas. O operador de soma, "``+``", concatena duas listas. O operador "``+=``" é um atalho para o método ``L.extend`` conforme mostrado na listagem :ref:`ex-oplista`::

    >>> lista=['a', 'pe', 1, 2, 'a', 'b']
    >>> lista = lista + ['novo', 'elemento']
    >>> lista ['a', 'pe', 1, 2, 'a', 'b', 'novo', 'elemento']
    >>> lista += 'dois' lista ['a', 'pe', 1, 2, 'a', 'b', 'd', 'o', 'i', 's']
    >>> lista += ['dois'] lista ['a', 'pe', 1, 2, 'a', 'b', 'd', 'o', 'i', 's', 'dois'] li=[1,2] li\*3 [1, 2, 1, 2, 1, 2]


Note que a operação ``lista = lista + lista2`` cria uma nova ``lista`` enquanto que o comando ``+=`` aproveita a lista original e a extende. Esta diferença faz com que o operador ``+=`` seja
muito mais rápido, especialmente para grandes listas. O operador de multiplicação, ````*''``, é um repetidor/concatenador de listas conforme mostrado ao final da listagem :ref:`ex-oplista`. A operação de multiplicação *in situ*(``*=``) também é válida.

Um tipo de lista muito útil em aplicações científicas, é lista numérica sequencial. Para construir estas listas podemos utilizar o comando ``range`` (exemplo :ref:`ex-range`). O comando ``range`` aceita 1, 2 ou três argumentos: início, fim e passo, respectivamente (ver exemplo :ref:`ex-range`)::

    >>> range(10) [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    >>> range(2,20,2) #números pares
    [2, 4, 6, 8, 10, 12, 14, 16, 18]
    >>> range(1,20,2) #números ímpares
    [1, 3, 5, 7, 9, 11, 13, 15, 17, 19]

Tuplas
------

.. index: tuplas

Uma tupla, é uma lista imutável, ou seja, ao contrário de uma lista, após a sua criação, ela não pode ser alterada. Uma tupla é definida de maneira similar a uma lista, com exceção dos delimitadores do conjunto de elementos que no caso de uma tupla são parênteses (listagem ex-criatupla)::

    >>> tu = ('Genero', 'especie', 'peso', 'estagio')
    >>> tu[0]
    'Genero'
    >>> tu[1:3]
    ('especie', 'peso')


Os elementos de uma tupla podem ser referenciados através de índices, (posição) de forma idêntica a como é feito em listas. Tuplas também podem ser fatiadas, gerando outras tuplas.

As tuplas não possuem métodos. Isto se deve ao fato de as tuplas serem imutáveis. Os métodos ``append``, ``extend``, e ``pop`` naturalmente não se aplicam a tuplas, uma vez que não se pode adicionar ou remover elementos de uma tupla. Não podemos fazer busca em tuplas, visto que não dispomos do método ``index``. No entanto, podemos usar ``in`` para determinar se um elemento existe em uma tupla, como se faz em listas::

    >>> tu=()
    >>> tu
    ()
    >>> tu='casa', #Repare na vírgula ao final!
    >>> tu
    ('casa',)
    >>> tu=1,2,3,4
    >>> tu
    (1, 2, 3, 4)
    >>> var = w,x,y,z
    >>> var
    (w,x,y,z)
    >>> var = tu
    >>> w
    1
    >>> x
    2
    >>> y
    3
    >>> z
    4


Conforme exemplificado em ex-criatupla2, uma tupla vazia, é definida pela expressão ``()``, já no caso de uma tupla unitária, isto é, com apenas um elemento, fazemos a atribuição com uma vírgula após o elemento, caso contrário (``tu=('casa')`` ), o interpretador não poderá distinguir se os parênteses estão sendo utilizados como delimitadores normais ou delimitadores de tupla. O comando ``tu=('casa',)`` é equivalente ao apresentado na quarta linha da listagem ex-criatupla2, apenas mais longo.

Na sétima linha da listagem ex-criatupla2, temos uma extensão do conceito apresentado na linha anterior: a definição de uma tupla sem a necessidade de parênteses. A este processo, se dá o nome de *empacotamento de sequência*. O empacotamento de vários elementos sempre gera uma tupla.

As tuplas, apesar de não serem tão versáteis quanto as listas, são mais rápidas. Portanto, sempre que se precisar de uma sequênca de elementos para servir apenas de referência, sem a necessidade de edição, deve-se utilizar uma tupla. Tuplas também são úteis na formatação de strings como veremos na listagem ex-formstring.

Apesar das tuplas serem imutáveis, pode-se contornar esta limitação fatiando e concatenando tuplas. Listas também podem ser convertidas em tuplas, com a função ``tuple(lista)``, assim como tuplas podem ser convertidas em listas através da função ``list(tupla)``.

Uma outra aplicação interessante para tuplas, mostrada na listagem ex-criatupla2, é a atribuição múltipla, em que uma tupla de valores, é atribuída a uma lista de nomes de variáveis armazenados em uma tupla. Neste caso, as duas sequências devem ter, exatamente,
o mesmo número de elementos.

Strings
-------

.. index: strings

Strings são um terceiro tipo de sequências em Python. Strings são sequências de caracteres delimitados por aspas simples, ``'string345'`` ou duplas ``"string"``. Todos os operadores discutidos até agora para outras sequências, tais como ``+``, ``*``, ``in``, ``not in``, ``s[i]`` e ``s[i:j]``, também são válidos para strings. Strings também podem ser definidas com três aspas (duplas ou simples). Esta última forma é utilizada para definir strings contendo quebras de linha::

    >>> st='123 de oliveira4'
    >>> len(st)
    16
    >>> min(st)
    ' '
    >>> max(st)
    'v'
    >>> texto = """primeira linha
    segunda linha
    terceira linha"""
    >>> print texto
    primeira linha
    segunda linha
    terceira linha


Conforme ilustrado na listagem ex-string, uma string é uma sequência de quaisquer caracteres alfanuméricos, incluindos espaços. A função ``len()``, retorna o comprimento da string, ou de uma lista ou tupla. As funções ``min()`` e ``max()`` retornam o valor mínimo e o máximo de uma sequência, respectivamente. Neste caso, como a sequência é uma string, os valores são os códigos ASCII de cada caracter. Estes comandos também são válidos para listas e tuplas.

O tipo String possui 40 métodos distintos (na versão 2.7.3 do Python). Seria por demais enfadonho listar e descrever cada um destes métodos neste capítulo. Nesta seção vamos ver alguns métodos de strings em ação no contexto de alguns exemplos. Outros métodos aparecerão em outros exemplos nos demais capítulos.

O uso mais comum dado a strings é a manipulação de textos que fazem parte da entrada ou saída de um programa. Nestes casos, é interessante poder montar strings, facilmente, a partir de outras estruturas de dados. Em Python, a inserção de valores em strings envolve o marcador ``%s``.
::
    >>> animal='Hamster 1'
    >>> peso=98
    >>> '%s: %s gramas'%(animal,peso)
    'Hamster 1: 98 gramas'


.. index: strings; formatando

Na listagem ex-formstring, temos uma expressão de sintaxe não tão óbvia mas de grande valor na geração de strings. O operador ``%`` (módulo), indica que os elementos da tupla seguinte serão mapeados, em sequência, nas posições indicadas pelos marcadores ``%s`` na string.

Esta expressão pode parecer uma complicação desnecessária para uma simples concatenação de strings. Mas não é. Vejamos porquê:

    >>> animal='Hamster 1'
    >>> peso=98
    >>> '%s: %s gramas'%(animal,peso)
    'Hamster 1: 98 gramas'
    >>> 'Hamster 1: 98 gramas' animal+': '+peso+' gramas'
    Traceback (most recent call last): File "input", line 1, in ?
    TypeError: cannot concatenate 'str' and 'int' objects


Pelo erro apresentado na listagem ex-concstring, vemos que a formatação da string utilizando o operador módulo e os marcadores ``%s``, faz mais do que apenas concatenar strings, também converte a variável **peso** (inteiro) em uma string.

Dicionários
-----------

.. index:
   pair: dict, dicionários

O dicionário é um tipo de dado muito interessante do Python: É uma estrutura que funciona como um banco de dados em miniatura, no sentido de que seus elementos consistem de pares "**chave : valor**", armazenados sem ordenação. Isto significa que não existem índices para os elementos de um dicionário, a informação é acessada através das chaves.
::
    >>> Z={'C':12, 'O':16, 'N':12, 'Na':40}
    >>> Z['O']
    16
    >>> Z['H']=1
    >>> Z
    {'Na': 40, 'C': 12, 'H': 1, 'O': 16, 'N': 12}
    >>> Z.keys()
    ['Na', 'C', 'H', 'O', 'N']
    >>> Z.has_key('N')
    True
    >>> 'Na' in Z
    True


As chaves podem ser de qualquer tipo imutável: números, strings, tuplas (que contenham apenas tipos imutáveis). Dicionários possuem os métodos listados na tabela tab:metdic.

Os conjuntos (chave:valor) são chamados de ítens do dicionários. Esta terminologia é importante pois podemos acessar, separadamente, chaves, valores ou ítens de um dicionário.

Os valores de um dicionário podem ser de qualquer tipo, números, strings, listas, tuplas e até mesmo outros dicionários. Também não há qualquer restrição para o armazenamento de diferentes tipos de dados em um mesmo dicionário.

Conforme exemplificado em ex-criadic, pode-se adicionar novos ítens a um dicionário, a qualquer momento, bastando atribuir um valor a uma chave. Contudo, é preciso ter cuidado. Se você tentar criar um ítem com uma chave que já existe, o novo ítem substituirá o antigo.



.. index: dicionários; métodos

Os métodos ``D.iteritems()``, ``D.iterkeys()`` e ``D.itervalues()`` criam iteradores. Iteradores permitem iterar através dos ítens, chaves ou valores de um dicionário. Veja a listagem ex-iterdic:

    >>> Z.items()
    [('Na', 40), ('C', 12), ('H', 1), ('O', 16), ('N', 12)]
    >>> i=Z.iteritems()
    >>> i
    dictionary-iterator object at 0x8985d00
    >>> i.next()
    ('Na', 40)
    >>> i.next()
    ('C', 12) # e assim por diante...
    >>> k=Z.iterkeys()
    >>> k.next()
    'Na'
    >>> k.next()
    'C'
    >>> k.next()
    'H'
    >>> k.next()
    'O'
    >>> k.next()
    'N'
    >>> k.next()
    Traceback (most recent call last): File "input", line 1,
    in ? StopIteration


O uso de iteradores é interessante quando se precisa acessar o conteúdo de um dicionário, elemento-a-elemento, sem repetição. Ao final da iteração, o iterador retorna um aviso: ``StopIteration``.

Conjuntos
---------

.. index: conjuntos

Reafirmando sua vocação científica, a partir da versão 2.4, uma estrutura de dados para representar o conceito matemático de conjunto foi introduzida na linguagem Python. Um conjunto no Python é uma coleção de elementos sem ordenação e sem repetições. O objeto conjunto em Python aceita operações matemáticas de conjuntos tais como união, interseção, diferença e diferença simétrica (exemplo ex-conjuntos).
::
    >>> a = set('pirapora')
    >>> b = set('paranapanema')
    >>> a #letras em a
    set(['i', 'p', 'r', 'a', 'o'])
    >>> a - b # Letras em a mas não em b
    set(['i', 'o'])
    >>> a | b #letras em a ou b
    set(['a', 'e', 'i', 'm', 'o', 'n', 'p', 'r'])
    >>> a & b #letras em a e b
    set(['a', 'p', 'r'])
    >>> a ^ b #letras em a ou b mas não em ambos
    set(['i', 'm', 'e', 'o', 'n'])


No exemplo ex-conjuntos pode-se observar as seguintes correspondências entre a notação do Python e a notação matemática convencional:

a - b:
    :math:`A-B` [7]_

a :math:`\mid` b:
    :math:`A\cup B`

a & b:
    :math:`A\cap B`

a :math:`\hat{ }` b:
    :math:`(A\cup B)-(A\cap B)`


Controle de fluxo
=================

Em condições normais o interpretador executa as linhas de um
programa uma a uma. As exceções a este caso são linhas pertencentes
à definição de função e classe, que são executadas apenas quando a
respectiva função ou classe é chamada. Entretanto algumas palavras
reservadas tem o poder de alterar a direção do fluxo de execução
das linhas de um programa. {Condições} Toda linguagem de
programação possui estruturas condicionais que nos permitem
representar decisões:
"se isso, faça isso, caso contrário faça aquilo". Estas estruturas
também são conhecidas por ramificações. O Python nos disponibiliza
três palavras reservadas para este fim: ``if`` , ``elif`` e
``else``. O seu uso é melhor demonstrado através de um exemplo
(Listagem ex-ifelif).

    if a == 1: este bloco é executado se a for 1 pass elif a == 2: este
    bloco é executado se a for 2 pass else: este bloco é executado se
    se se nenhum dos blocos anteriores tiver sido executado pass


{if}{elif}{else}

No exemplo ex-ifelif, vemos também emprego da palavra reservada
``pass``, que apesar de não fazer nada é muito útil quando ainda
não sabemos quais devem ser as consequências de determinada
condição.

Uma outra forma elegante e compacta de implementar uma ramificação
condicional da execução de um programa é através de dicionários
(Listagem ex-brdict). As condições são as chaves de um dicionário
cujos valores são funções. Esta solução não contempla o ``else``,
porém.

    desfechos = 1:fun1,2:fun2 desfechos[a]


Iteração
--------

{iteração} Muitas vezes em problemas computacionais precisamos
executar uma tarefa, repetidas vezes. Entretanto não desejamos ter
que escrever os mesmos comandos em sequência, pois além de ser uma
tarefa tediosa, iria transformar nosso "belo" programa em algo
similar a uma lista telefônica. A solução tradicional para resolver
este problema é a utilização de laços (loops) que indicam ao
interpretador que ele deve executar um ou mais comandos um número
arbitrário de vezes. Existem vários tipos de laços disponíveis no
Python.

{O laço \*while}:}{while} O laço ``while`` repete uma tarefa
enquanto uma condição for verdadeira (Listagem ex-loops). Esta
tarefa consiste em um ou mais comandos indentados em relação ao
comando que inicia o laço. O fim da indentação indica o fim do
bloco de instruções que deve ser executado pelo laço.

    while True: passrepete indefinidamente i=0 while i 10: i +=1 print
    i saida omitida for i in range(1): print i


{O laço \*for}:}{for} O laço ``for`` nos permite iterar
sobre uma sequência atribuindo os elementos da mesma a uma
variável, sequencialmente, à medida que prossegue. Este laço se
interrompe automaticamente ao final da sequência.

{Iteração avançada:}O Python nos oferece outras técnicas de
iteração sobre sequências que podem ser bastante úteis na redução
da complexidade do código. No exemplo ex-iterdic nós vimos que
dicionários possuem métodos específicos para iterar sobre seus
componentes. Agora suponhamos que desejássemos iterar sobre uma
lista e seu índice?

    for n,e in enumerate(['a','b','c','d','e']): print "

    0: a 1: b 2: c 3: d 4: e


{enumerate} A função ``enumerate`` (exemplo ex-enumerate) gera um
iterador similar ao visto no exemplo ex-iterdic. O laço ``for``
chama o método ``next`` deste iterador repetidas vezes, até que
receba a mensagem ``StopIteration`` (ver exemplo ex-iterdic).

O comando ``zip`` nos permite iterar sobre um conjunto de
seqûencias pareando sequencialmente os elementos das múltiplas
listas (exemplo ex-zip).

    perguntas = ['nome','cargo','partido'] respostas =
    ['Lula','Presidente','PT'] for p,r in zip(perguntas,respostas):
    print "qual o seu

    qual o seu nome? Lula qual o seu cargo? Presidente qual o seu
    partido? PT


{zip}

Podemos ainda desejar iterar sobre uma sequência em ordem reversa
(exemplo ex-rev), ou iterar sobre uma sequência ordenada sem
alterar a sequência original (exemplo ex-itsort). Note que no
exemplo ex-itsort, a lista original foi convertida em um conjunto
(``set``) para eliminar as repetições.

    for i in reversed(range(5)): print i 4 3 2 1 0


    for i in sorted(set(l)): print i laranja leite manga ovos uva


Iterações podem ser interrompidas por meio da palavra reservada
``break``. Esta pode ser invocada quando alguma condição se
concretiza. Podemos também saltar para a próxima iteração (sem
completar todas as instruções do bloco) por meio da palavra
reservada ``continue``. A palavra reservada ``else`` também pode
ser aplicada ao final de um bloco iterativo. Neste caso o bloco
definido por ``else`` só será executado se a iteração se completar
normalmente, isto é, sem a ocorrência de ``break``.{break}

Lidando com erros: Exceções
---------------------------

{try}{except}{finally}{exceções} O método da tentativa e erro não é
exatamente aceito na ortodoxia científica mas, frequentemente, é
utilizado no dia a dia do trabalho científico. No contexto de um
programa, muitas vezes somos forçados a lidar com possibilidades de
erros e precisamos de ferramentas para lidar com eles.

Muitas vezes queremos apenas continuar nossa análise, mesmo quando
certos erros de menor importância ocorrem; outras vezes, o erro é
justamente o que nos interessa, pois nos permite examinar casos
particulares onde nossa lógica não se aplica.

Como de costume o Python nos oferece ferramentas bastante
intuitivas para interação com erros [8]_.

    1/0 Traceback (most recent call last): File "stdin", line 1, in ?
    ZeroDivisionError: integer division or modulo by zero


Suponhamos que você escreva um programa que realiza divisões em
algum ponto, e dependendo dos dados fornecidos ao programa, o
denominador torna-se zero. Como a divisão por zero não é possível,
o seu programa para, retornando uma mensagem similar a da listagem
ex-exception. Caso você queira continuar com a execução do programa
apesar do erro, poderíamos solucionar o problema conforme o exposto
na listagem ex-try

    for i in range(5): ... try: ... q=1./i ... print q ... except
    ZeroDivisionError: ... print "Divisão por zero!" ... Divisão por
    zero! 1.0 0.5 0.333333333333 0.25


A construção {try:\\ldots except:} nos permite verificar a
ocorrência de erros em partes de nossos programas e responder
adequadamente a ele. o Python reconhece um grande número de tipos
de exceções, chamadas "built-in exceptions". Mas não precisamos
sabê-las de cor, basta causar o erro e anotar o seu nome.

Certas situações podem estar sujeitas à ocorrência de mais de um
tipo de erro. neste caso, podemos passar uma tupla de exceções para
a palavra-chave ``except``:
``except (NameError, ValueError,IOError):pass``, ou simplesmente
não passar nada: ``except: pass``. Pode acontecer ainda que
queiramos lidar de forma diferente com cada tipo de erro (listagem
ex-multexc).

    try: f = open('arq.txt') s = f.readline() i = int(s.strip()) except
    IOError, (errno, strerror): print "Erro de I/O (

    except ValueError: print "Não foi possível converter o dado em
    Inteiro." except: print "Erro desconhecido."


A construção {try:\\ldots except:} acomoda ainda uma cláusula
``else`` opcional, que será executada sempre que o erro esperado
não ocorrer, ou seja, caso ocorra um erro imprevisto a cláusula
``else`` será executada (ao contrário de linhas adicionais dentro
da cláusula ``try``).

Finalmente, ``try`` permite uma outra cláusula opcional,
``finally``, que é sempre executada (quer haja erros quer não). Ela
é util para tarefas que precisam ser executadas de qualquer forma,
como fechar arquivos ou conexões de rede. {Funções}{funções} No
Python, uma função é um bloco de código definido por um cabeçalho
específico e um conjunto de linhas indentadas, abaixo deste.
Funções, uma vez definidas, podem ser chamadas de qualquer ponto do
programa (desde que pertençam ao espaço de nomes). Na verdade, uma
diferença fundamental entre uma função e outros objetos é o fato de
ser "chamável". Isto decorre do fato de todas as funções possuirem
um método [9]_ chamado {\\\_\\\_call\\\_\\\_}. Todos os objetos que
possuam este método poderão ser chamados [10]_.

O ato de chamar um objeto, em Python, é caracterizado pela aposição
de parênteses ao nome do objeto. Por exemplo: ``func()``. Estes
parênteses podem ou não conter "argumentos". Continue lendo para
uma explicação do que são argumentos.

Funções também possuem seu próprio espaço de nomes, ou seja, todas
as variáveis definidas no escopo de uma função só existem dentro
desta. Funções são definidas pelo seguinte cabeçalho:

    def nome(par1, par2, par3=valordefault, \*args, \*\*kwargs):


A palavra reservada ``def`` indica a definição de uma função; em
seguida deve vir o nome da função que deve seguir as regras de
formação de qualquer nome em Python. Entre parênteses vem,
opcionalmente, uma lista de argumentos que serão ser passados para
a função quando ela for chamada. Argumentos podem ter valores
"default" se listados da forma ``a=1``. Argumentos com valores
default devem vir necessariamente após todos os argumentos sem
valores default(Listagem ex-funbas).

    def fun(a,b=1): ... print a,b ... fun(2) 2 1 fun(2,3) 2 3
    fun(b=5,2) SyntaxError: non-keyword arg after keyword arg


{funçoes!argumentos opcionais} Por fim, um número variável de
argumentos adicionais pode ser previsto através de argumentos
precedidos por ``*`` ou ``**``. No exemplo acima, argumentos
passados anonimamente (não associados a um nome) serão colocados em
uma tupla de nome ``t``, e argumentos passados de forma nominal
(z=2,q='asd')serão adicionados a um dicionário, chamado
``d``(Listagem ex-kwargs).

    def fun(\*t, \*\*d): print t, d fun(1,2,c=2,d=4) (1,2)
    'c':3,'d':4


{funções!lista de argumentos variável} Funções são chamadas
conforme ilustrado na linha 3 da listagem ex-kwargs. Argumentos
obrigatórios, sem valor "default", devem ser passados primeiro.
Argumentos opcionais podem ser passados fora de ordem, desde que
após os argumentos obrigatórios, que serão atribuídos
sequencialmente aos primeiros nomes da lista definida no cabeçalho
da função(Listagem ex-funbas).

Muitas vezes é conveniente "desempacotar" os argumentos passados
para uma função a partir de uma tupla ou dicionário.
{funções!passando argumentos}

    def fun(a,b,c,d): print a,b,c,d t=(1,2);di = 'd': 3, 'c': 4
    fun(\*t,\*\*di) 1 2 4 3


Argumentos passados dentro de um dicionário podem ser utilizados
simultâneamente para argumentos de passagem obrigatória (declarados
no cabeçalho da função sem valor "default") e para argumentos
opcionais, declarados ou não(Listagem ex-passdic).

    def fun2(a, b=1,\*\*outros): ... print a, b, outros ... dic =
    'a':1,'b':2,'c':3,'d':4 fun2(\*\*dic) 1 2 'c': 3, 'd': 4


Note que no exemplo ex-passdic, os valores cujas chaves
correspondem a argumentos declarados, são atribuídos a estes e
retirados do dicionário, que fica apenas com os ítens restantes.

Funções podem retornar valores por meio da palavra reservada
``return``.

    def soma(a,b): return a+b print "ignorado!" soma (3,4) 7


A palavra return indica saída imediata do bloco da função levando
consigo o resultado da expressão à sua direita.{return}

Funções lambda
--------------

{lambda} Funções lambda são pequenas funções anônimas que podem ser
definidas em apenas uma linha. Por definição, podem conter uma
única expressão.

    def raiz(n):definindo uma raiz de ordem n return
    lambda(x):x\*\*(1./n) r4 = raiz(4)r4 calcula a raiz de ordem 4
    r4(16) utilizando 2


Observe no exemplo (ex-lamb), que lambda lembra a definição de
variáveis do espaço de nome em que foi criada. Assim, ``r4`` passa
a ser uma função que calcula a raiz quarta de um número. Este
exemplo nos mostra que podemos modificar o funcionamento de uma
função durante a execução do programa: a função raiz retorna uma
função raiz de qualquer ordem, dependendo do argumento que receba.
{Geradores}{geradores} Geradores são um tipo especial de função que
retém o seu estado de uma chamada para outra. São muito
convenientes para criar iteradores, ou seja, objetos que possuem o
método ``next()``.

    def letras(palavra): for i in palavra: yield i for L in
    letras('gato'): print L g a t o


Como vemos na listagem ex-ger um gerador é uma função sobre a qual
podemos iterar. {Decoradores}{decoradores} Decoradores são uma
alteração da sintaxe do Python, introduzida a partir da versão 2.4,
para facilitar a modificação de funções (sem alterá-las),
adicionando funcionalidade. Nesta seção vamos ilustrar o uso básico
de decoradores. Usos mais avançados podem ser encontrados nesta
url: http://wiki.python.org/moin/PythonDecoratorLibrary.

    def faznada(f): def novaf(\*args,\*\*kwargs): print
    "chamando...",args,kwargs return f(\*args,\*\*kwargs) novaf.name =
    f.name novaf.doc = f.doc novaf.dict.update(f.dict) return novaf


Na listagem ex-dec, vemos um decorador muito simples. Como seu nome
diz, não faz nada, além de ilustrar a mecânica de um decorador.
Decoradores esperam um único argumento: uma função. A listagem
ex-decuso, nos mostra como utilizar o decorador.

    @faznada def soma(a,b): return a+b

    soma(1,2) chamando... (1, 2) Out[5]:3


O decorador da listagem ex-dec, na verdade adiciona uma linha de
código à função que decora: {print "chamando...",args,kwargs}.

Repare que o decorador da listagem ex-dec, passa alguns atributos
básicos da função original para a nova função, de forma que a
função decorada possua o mesmo nome, docstring, etc. que a funçao
original. No entanto, esta passagem de atributos "polui" o código
da função decoradora. Podemos evitar a poluição e o trabalho extra
utilizando a funcionalidade do módulo functools.

    from functools import wraps def meuDecorador(f): ... @wraps(f) ...
    def novaf(\*args, \*\*kwds): ... print 'Chamando funcao decorada '
    ... return f(\*args, \*\*kwds) ... return novaf ... @meuDecorador
    ... def exemplo(): ... """Docstring""" ... print 'funcao exemplo
    executada!' ... exemplo() Chamando funcao decorada funcao exemplo
    executada! exemplo.name 'exemplo' exemplo.doc 'Docstring'


Decoradores nao adicionam nenhuma funcionalidade nova ao que já é
possível fazer com funções, mas ajudam a organizar o código e
reduzir a necessidade duplicação. Aplicações científicas de
decoradores são raras, mas a sua presença em pacotes e módulos de
utilização genérica vem se tornando cada vez mais comum. Portanto,
familiaridade com sua sintaxe é aconselhada.
{Strings de Documentação} Strings posicionadas na primeira linha de
uma função, ou seja, diretamente abaixo do cabeçalho, são
denominadas strings de documentação, ou simplesmente
``docstrings``.

Estas strings devem ser utilizadas para documentar a função
explicitando sua funcionalidade e seus argumentos. O conteúdo de
uma docstring está disponível no atributo {\\\_\\\_doc\\\_\\\_} da
função.

Ferramentas de documentação de programas em Python extraem estas
strings para montar uma documentação automática de um programa. A
função help(nome\_da\_função) também retorna a docstring. Portanto
a inclusão de docstrings auxilia tanto o programador quanto o
usuário.

    def soma(a,b): """ Esta funcao soma dois numeros: soma(2,3) 5 """
    return a+b help(soma) Help on function soma in module main:

    soma(a, b) Esta funcao soma dois numeros: soma(2,3) 5


No exemplo ex-docst, adicionamos uma docstring explicando a
finalidade da função soma e ainda incluímos um exemplo. Incluir um
exemplo de uso da função cortado e colado diretamente do console
Python (incluindo o resultado), nos permitirá utilizar o módulo
``doctest`` para testar funções, como veremos mais adiante.
{Módulos e Pacotes}{módulos} Para escrever programas de maior porte
ou agregar coleções de funções e/ou objetos criados pelo usuário, o
código Python pode ser escrito em um arquivo de texto, salvo com a
terminação ``.py``, facilitando a re-utilização daquele código.
Arquivos com código Python contruídos para serem importados, são
denominados "módulo". {import} Existem algumas variações na forma
de se importar módulos. O comando ``import meumodulo`` cria no
espaço de nomes um objeto com o mesmo nome do módulo importado.
Funções, classes (ver capítulo cap:obj) e variáveis definidas no
módulo são acessíveis como atributos deste objeto. O comando
``from modulo import *`` importa todas as funções e classes
definidas pelo módulo diretamente para o espaço de nomes
global [11]_ do nosso script. Deve ser utilizado com cuidado pois
nomes iguais pré-existentes no espaço de nomes global serão
redefinidos. Para evitar este risco, podemos substituir o ``*`` por
uma sequência de nomes correspondente aos objetos que desejamos
importar: ``from modulo import nome1, nome2``. Podemos ainda
renomear um objeto ao importá-lo: ``import numpy as N`` ou ainda
``from numpy import det as D``.

[float,frame=trBL, caption=Módulo exemplo, label=ex-modfib] {code/fibo.py}

Seja um pequeno módulo como o do exemplo ex-modfib. Podemos
importar este módulo em uma sessão do interpretador iniciada no
mesmo diretório que contém o módulo (exemplo ex-import).

    import fibo fibo.fib(50) 1 1 2 3 5 8 13 21 34 fibo.name 'fibo'


Note que a função declarada em ``fibo.py`` é chamada como um método
de ``fibo``. Isto é porque módulos importados são objetos (como
tudo o mais em Python).

Quando um módulo é importado ou executado diretamente , torna-se um
objeto com um atributo {\\\_\\\_name\\\_\\\_}. O conteúdo deste
atributo depende de como o módulo foi executado. Se foi executado
por meio de importação, {\\\_\\\_name\\\_\\\_} é igual ao nome do
módulo (sem a terminação ".py"). Se foi executado diretamente
(``python modulo.py``), {\\\_\\\_name\\\_\\\_} é igual a
{\`\`\\\_\\\_main\\\_\\\_''}.

Durante a importação de um módulo, todo o código contido no mesmo é
executado, entretanto como o {\\\_\\\_name\\\_\\\_} de fibo é
````fibo''`` e não {\`\`\\\_\\\_main\\\_\\\_''}, as linhas abaixo
do ``if`` não são executadas. Qual então a função destas linhas de
código? Módulos podem ser executados diretamente pelo
interpretador, sem serem importados primeiro. Vejamos isso no
exemplo ex-runmod. Podemos ver que agora o {\\\_\\\_name\\\_\\\_}
do módulo é {\`\`\\\_\\\_main\\\_\\\_''} e, portanto, as linhas de
código dentro do bloco ``if`` são executadas. Note que neste caso
importamos o módulo ``sys``, cujo atributo ``argv`` nos retorna uma
lista com os argumentos passados para o módulo a partir da posição
:math:`$1$`. A posição :math:`$0$` é sempre o nome do módulo.

    :math:`$ python fibo.py 60
__main__
['fibo.py', '60']
1 1 2 3 5 8 13 21 34 55
\end{lstlisting}

Qualquer arquivo com terminação  *.py} é considerado um módulo Python pelo interpretador Python. Módulos podem ser executados diretamente ou ``importados'' por outros módulos.

A linguagem Python tem como uma de suas principais vantagens uma biblioteca bastante ampla de módulos, incluída com a distribuição básica da linguagem. Nesta seção vamos explorar alguns módulos da biblioteca padrão do Python, assim como outros, módulos que podem ser obtidos e adicionados à sua instalação do Python.

Para simplicidade de distribuição e utilização, módulos podem ser agrupados em ``pacotes''. Um pacote nada mais é do que um diretório contendo um arquivo denominado *\_\_init\_\_.py} (este arquivo não precisa conter nada). Portanto, pode-se criar um pacote simplesmente criando um diretório chamado, por exemplo, ``pacote'' contendo os seguintes módulos: *modulo1.py} e *modulo2.py}\footnote{Além de *\_\_init\_\_.py}, naturalmente.}. Um pacote pode conter um número arbitrário de módulos, assim como outros pacotes.

Como tudo o mais em Python, um pacote também é um objeto. Portanto, ao importar o pacote ``pacote'' em uma sessão Python, modulo1 e modulo2 aparecerão como seus atributos (listagem :ref:`ex-importing}).
\begin{lstlisting}[caption=importing a package,label=ex-importing]
>>> import pacote
>>> dir(pacote)
['modulo1','modulo2']
\end{lstlisting}
\.. index:: pacotes;

\subsection{Pacotes Úteis para Computação Científica}
\subsubsection{*Numpy}}
Um dos pacotes mais importantes, senão o mais importante para quem deseja utilizar o Python em computação científica, é o *numpy}. Este pacote contém uma grande variedade de módulos voltados para resolução de problemas numéricos de forma eficiente.

Exemplos de objetos e funções pertencentes ao pacote *numpy} aparecerão regularmente na maioria dos exemplos deste livro. Uma lista extensiva de exemplos de Utilização do Numpy pode ser consultada neste endereço: \url{http://www.scipy.org/Numpy_Example_List}

Na listagem :ref:`ex-det}, vemos um exemplo de uso típico do *numpy}. O *numpy} nos oferece um objeto matriz, que visa representar o conceito matemático de matriz. Operações matriciais derivadas da algebra linear, são ainda oferecidas como funções através do subpacote linalg (Listagem :ref:`ex-det}).

.. index:: numpy;
.. index:: módulos!numpy;

\begin{lstlisting}[ caption=Calculando e mostrando o determinante de uma matriz. ,label=ex-det]
>>> from numpy import * 
>>> a = arange(9)
>>> print a
[0 1 2 3 4 5 6 7 8]
>>> a.shape =(3,3)
>>> print a
[[0 1 2]
 [3 4 5]
 [6 7 8]]
>>> from numpy.linalg import det
>>> det(a)
0.0
>>> 
\end{lstlisting}

Na primeira linha do exemplo :ref:`ex-det}, importamos todas as funções e classes definidas no módulo numpy.


Na segunda linha, usamos o comando *arange(9)} para criar um vetor *a}  de 9 elementos. Este comando é equivalente ao *range} para criar listas, só que retorna um vetor (matriz unidimensional). Note que este vetor é composto de números inteiros sucessivos começando em zero. Todas as enumerações em Python começam em zero. Como em uma lista, *a[0]} é o primeiro elemento do vetor *a}. O objeto que criamos, é do tipo \textbf{array}, definido no módulo *numpy}. Uma outra forma de criar o mesmo objeto seria: 
*a = array([0,1,2,3,4,5,6,7,8])}.

.. index:: arange;
.. index:: print;

Na terceira linha, nós mostramos o conteúdo da variável *a} com o comando *print}. Este comando imprime na tela o valor de uma variável.

.. index:: array;
.. index:: array;shape

Como tudo em Python é um objeto, o objeto array apresenta diversos métodos e atributos. O atributo chamado *shape} contém o formato da matriz como uma tupla, que pode ser multi-dimensional ou não. Portanto, para converter vetor *a} em uma matriz *3$`:math:`$3}, basta atribuir o valor *(3,3)} a *shape}. Conforme já vimos, atributos e métodos de objetos são referenciados usando-se esta notação de ponto\footnote{nome\_da\_variável.atributo}.

Na quinta linha, usamos o comando *print} para mostrar a alteração na forma da variável *a}. 

.. index:: triple: módulo;numpy;linalg;

Na sexta linha importamos a função *det} do módulo *numpy.linalg} para calcular o determinante da nossa matriz. A função *det(a)} nos informa, então, que o determinante da matriz *a} é *0.0}. 
\subsubsection{*Scipy}}
.. index:: scipy
.. index:: pair:módulo;scipy
Outro módulo muito útil para quem faz computação numérica com Python, é o *scipy}. O *scipy} depende do numpy e provê uma grande coleção de rotinas numéricas voltadas para aplicações em matemática, engenharia e estatística. 

Diversos exemplos da segunda parte deste livro se utilizarão do scipy, portanto, não nos extenderemos em exemplos de uso do *scipy}.

Uma lista extensa de exemplos de utilização do *scipy} pode ser encontrada no seguinte endereço:\url{http://www.scipy.org/Documentation}.


\section{Documentando Programas}
Parte importante de um bom estilo de trabalho em computação científica é a documentação do código produzido. Apesar do Python ser uma linguagem bastante clara e de fácil leitura por humanos, uma boa dose de documentação é sempre positiva.

O Python facilita muito a tarefa tanto do documentador quanto do usuário da documentação de um programa. Naturalmente, o trabalho de documentar o código deve ser feito pelo programador, mas todo o resto é feito pela própria linguagem.

A principal maneira de documentar programas em Python é através da adição de strings de documentação (``docstrings'') a funções e classes ao redigir o código. Módulos também podem possuir ``docstrings'' contendo uma sinopse da sua funcionalidade. Estas strings servem não somente como referência para o próprio programador durante o desenvolvimento, como também como material para ferramentas de documentação automática. A principal ferramenta de documentação disponível para desenvolvedores é o *pydoc}, que vem junto com a distribuição  da linguagem.

\subsection{Pydoc}
.. index:: pydoc
O *pydoc} é uma ferramenta que extrai e formata a documentação de programas Python. Ela pode ser utilizada de dentro do console do interpretador Python, ou diretamente do console do Linux.
\begin{lstlisting}[caption= ,label=]
$`
    pydoc pydoc


No exemplo acima, utilizamos o ``pydoc`` para examinar a
documentação do próprio módulo pydoc. Podemos fazer o mesmo para
acessar qualquer módulo disponível no ``PYTHONPATH``.

O ``pydoc`` possui algumas opções de comando muito úteis:

-k palavra
    Procura por palavras na documentação de todos os módulos.

    [-p porta nome] Gera a documentação em html iniciando um servidor
    HTTP na porta especificada da máquina local.

    [-g] Útil para sistemas sem fácil acesso ao console, inicia um
    servidor HTTP e abre uma pequena janela para busca.

    [-w nome] escreve a documentação requisitada em formato HTML, no
    arquivo ``<nome>.html``, onde ``<nome>`` pode ser um módulo
    instalado na biblioteca local do Python ou um módulo ou pacote em
    outra parte do sistema de arquivos. Muito útil para gerar
    documentação para programas que criamos.


Além do ``pydoc``, outras ferramentas mais sofisticadas,
desenvolvidas por terceiros, estão disponíveis para automatizar a
documentação de programas Python. Exploraremos uma alternativa a
seguir. {Epydoc} O ``Epydoc`` é uma ferramenta consideravelmente
mais sofisticada do que o módulos ``pydoc``. Além de prover a
funcionalidade já demontrada para o ``pydoc``, oferece outras
facilidades como a geração da documentação em formato ``PDF`` ou
``HTML`` e suporte à formatação das "docstrings".

O uso do Epydoc é similar ao do ``pydoc``. Entretanto, devido à sua
maior versatilidade, suas opções são bem mais numerosas (ex-epdh).

    epydoc -h


Não vamos discutir em detalhes as várias opções do ``Epydoc`` pois
estas encontram-se bem descritas na página ``man`` do programa.
Ainda assim, vamos comentar algumas funcionalidades interessantes.

A capacidade de gerar a documentação em , facilita a customização
da mesma pelo usuário e a exportação para outros formatos. A opção
``--url``, nos permite adicionar um link para o website de nosso
projeto ao cabeçalho da documentação. O ``Epydoc`` também verifica
o quão bem nosso programa ou pacote encontra-se documentado.
Usando-se a opção ``--check`` somos avisados sobre todos os objetos
não documentados.

A partir da versão 3.0, o ``Epydoc`` adiciona links para o código
fonte na íntegra, de cada elemento de nosso módulo ou pacote. A
opção ``--graph`` pode gerar três tipos de gráficos sobre nosso
programa, incluindo um diagrama ``UML``(Figura fig:epydoc).



Dada toda esta funcionalidade, vale apena conferir o Epydoc [12]_.

Exercícios
==========


#.
   Repita a iteração do exemplo ex-enumerate sem utilizar a função
   enumerate. Execute a iteração do objeto gerado por ``enumerate``
   manualmente, sem o auxílio do laço ``for`` e observe o seu
   resultado.

#.
   Adicione a funcionalidade ``else`` à listagem ex-brdict utilizando
   exceções.

#.
   Escreva um exemplo de iteração empregando ``break``, ``continue`` e
   ``else``(ao final).


.. [1] 
   Todos os processos no Linux e outros sistemas operacionais possuem
   vias de entrada e saída de dados denominados de stdin e stdout,
   respectivamente.

.. [2] 
   Repare como o Python trata a divisão de dois inteiros. Ela retorna
   o resultado arredondado para baixo

.. [3]  Assim como os outros tipos de números.

.. [4] 
   Mais quaisquer variáveis explicitamente definidas como globais

.. [5] 
   O inverso do operador ``in``, é o operador ``not in`` e também é
   válido para todas as sequências.

.. [6] 
   **Verdadeiro e falso:** Em Python, quase qualquer coisa pode ser
   utilizada em um contexto booleano, ou seja, como verdadeiro ou
   falso. Por exemplo ``0`` é falso enquanto que todos os outros
   números são verdadeiros.Uma string, lista, dicionário ou tupla
   vazias sào falsas enquanto que as demais são verdadeiras.

.. [7] 
   Por convenção representa-se conjuntos por letras maiúsculas.

.. [8] 
   Os erros tratados nesta seção não são erros de sintaxe mas erros
   que ocorrem durante a execução de programas sintaticamente
   corretos. Estes erros serão denomidados ``exceções``

.. [9]  Veja o capítulo 2 para uma explicação do que são métodos.

.. [10] 
   O leitor, neste ponto deve estar imaginando todo tipo de coisas
   interessantes que podem advir de se adicionar um método
   {\\\_\\\_call\\\_\\\_} a objetos normalmente não "chamáveis".

.. [11] 
   Dicionário de nomes de variáveis e funções válidos durante a
   execução de um script

.. [12]  http://epydoc.sourceforge.net


