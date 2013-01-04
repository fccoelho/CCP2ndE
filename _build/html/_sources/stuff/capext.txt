.. role:: math(raw)
   :format: html latex

{Interagindo com Outras Linguagens}(ch:capext)
{Introdução a vários métodos de integração do Python com outras linguagens. \\textbf{Pré-requisitos:} Capítulos \\ref{cap:intro} e \\ref{cap:obj}.}

Introdução
==========

O Python é uma linguagem extremamente poderosa e versátil,
perfeitamente apta a ser, não somente a primeira, como a última
linguagem de programação que um cientista precisará aprender.
Entretanto, existem várias situações nas quais torna-se
interessante combinar o seu código escrito em Python com códigos
escritos em outras linguagens. Uma das situações mais comuns, é a
necessidade de obter maior performance em certos algoritmos através
da re-implementação em uma linguagem compilada. Outra Situação
comum é possibilidade de se utilizar de bibliotecas desenvolvidas
em outras linguagens e assim evitar ter que reimplementá-las em
Python.

O Python é uma linguagem que se presta. extremamente bem. a estas
tarefas existindo diversos métodos para se alcançar os objetivos
descritos no parágrafo acima. Neste capítulo, vamos explorar apenas
os mais práticos e eficientes, do ponto de vista do tempo de
implementação.

Integração com a Linguagem ``C``
================================

A linguagem ``C`` é uma das linguagens mais utilizadas no
desenvolvimento de softwares que requerem alta performance. Um bom
exemplo é o Linux (kernel) e a própria linguagem Python. Este fato
torna o ``C`` um candidato natural para melhorar a performance de
programas em Python.

Vários pacotes científicos para Python como o *Numpy* e *Scipy*,
por exemplo, tem uma grande porção do seu código escrito em ``C``
para máxima performance. Coincidentemente, o primeiro método que
vamos explorar para incorporar código ``C`` em programas Python, é
oferecido como parte do pacote *Scipy*. {Weave}{weave} O ``weave``
é um módulo do pacote scipy, que permite inserir trechos de código
escrito em ``C`` ou ``C++`` dentro de programas em Python. Existem
várias formas de se utilizar o ``weave`` dependendo do tipo de
aplicação que se tem. Nesta seção, vamos explorar apenas a
aplicação do módulo ``inline`` do ``weave``, por ser mais simples e
cobrir uma ampla gama de aplicações. Além disso, utilizações mais
avançadas do ``weave``, exigem um conhecimento mais profundo da
linguagem ``C``, o que está fora do escopo deste livro. Caso os
exemplos incluídos não satisfaçam os anseios do leitor, existe uma
farta documentação no site www.scipy.org.

Vamos começar a explorar o ``weave`` com um exemplo trivial
(computacionalmente) um simples loop com uma única operação
(exemplo ex:weaveloop).

[frame=trBL, caption=Otimização de loops com o \\texttt{weave}, label=ex:weaveloop] {code/weaveloop.py}

No exemplo ex:weaveloop podemos ver como funciona o ``weave``. Uma
string contém o código ``C`` a ser compilado. A função ``inline``
compila o código em questão, passando para o mesmo as variáveis
necessárias.



Note que, na primeira execução do loop, o ``weave`` é mais lento
que o Python, devido à compilação do código; mas em seguida, com a
rotina já compilada e carregada na memória, este atraso não existe
mais.

O ``weave.inline`` tem uma performance inferior à de um programa em
``C`` equivalente, executado fora do Python. Mas a sua simplicidade
de utilização, compensa sempre que se puder obter um ganho de
performance sobre o Python puro.

[frame=trBL, caption=Calculando iterativamente a série de Fibonacci em Python e em \\texttt{C}(\\texttt{weave.inline}), label=ex:weavefib] {code/weavefib.py}

No exemplo ex:weavefib, o ganho de performance do ``weave.inline``
já não é tão acentuado.

    :math:`$ python weavefib.py
Tempo médio no python: 1.69277e-05 segundos
Tempo médio no weave: 1.3113e-05 segundos
Aceleração média: 1.49554 +- 0.764275
\end{lstlisting}

\subsection{Ctypes}\index{Ctypes}
O pacote \texttt{ctypes}, parte integrante do Python a partir da versão 2.5, é um módulo que nos permite invocar funções de bibliotecas em \texttt{C} pré-compiladas, como se fossem funções em Python.  Apesar da aparente facilidade de uso, ainda é necessário ter consciência do tipo de dados a função, que se deseja utilizar, requer. Por conseguinte, é necessário que o usuario tenha um bom conhecimento da linguagem \texttt{C}.

Apenas alguns objetos do python podem ser passados para funções através do ctypes: \texttt{None, inteiros, inteiros longos, strings, e strings unicode}. Outros tipos de dados devem ser convertidos, utilizando tipos fornecidos pelo \texttt{ctypes}, compatíveis com \texttt{C}.

Dado seu estágio atual de desenvolvimento, o \texttt{ctypes} não é a ferramenta mais indicada ao cientista que deseja fazer uso das conveniências do \texttt{C} em seus programas Python. Portanto, vamos apenas dar dois exemplos básicos para que o leitor tenha uma ideia de como funciona o \texttt{ctypes}. Para maiores informações recomendamos o tutorial do ctypes (\url{ http://python.net/crew/theller/ctypes/tutorial.html})

Nos exemplos abaixo assumimos que o leitor está utilizando Linux pois o uso do \texttt{ctypes} no Windows não é idêntico.

\begin{lstlisting}[frame=trBL, caption=Carregando bibliotecas em \texttt{C}, label=ex:ctypes1]
>>> from ctypes import *
>>> libc = cdll.LoadLibrary("libc.so.6")
>>> libc
<CDLL 'libc.so.6', handle ... at ...>
\end{lstlisting}

Uma vez importada uma biblioteca (listagem \ref{ex:ctypes1}), podemos chamar funções como atributos das mesmas.
\begin{lstlisting}[frame=trBL, caption=Chamando fuções em bibliotecas importadas com o ctypes, label=ex:ctypes2]
>>> libc.printf
<_FuncPtr object at 0x...>
>>> print libc.time(None) 
1150640792
>>> printf = libc.printf
>>> printf("Ola, %s\n", "Mundo!")
Ola, Mundo!
\end{lstlisting} 


\subsection{Pyrex}\index{Pyrex}
O Pyrex é uma linguagem muito similar ao Python feita para gerar módulos em \texttt{C} para o Python.
Desta forma, envolve um pouco mais de trabalho por parte do usuário, mas é de grande valor para acelerar código escrito em Python com pouquíssimas modificações.

O Pyrex não inclui todas as possibilidades da linguagem Python. As principais modificações são as que se seguem:
\begin{itemize}
 \item Não é permitido definir funções dentro de outras funções;
\item definições de classe devem ocorrer apenas no espaço de nomes global do módulo, nunca dentro de funções ou de outras classes;
\item Não é permitido \texttt{import *}. As outras formas de \texttt{import} são permitidas;
\item Geradores não podem ser definidos em Pyrex;
\item As funções \texttt{globals()} e \texttt{locals()} não podem ser utilizadas.
\end{itemize}

Além das limitações acima, existe um outro conjunto de limitações que é considerado temporário pelos desenvolvedores do Pyrex. São as seguintes:
\begin{itemize}
 \item Definições de classes e funções não podem ocorrer dentro de estruturas de controle (if, elif, etc.);
\item Operadores \textit{in situ} (+=, *=, etc.) não são suportados pelo Pyrex;
\item List comprehensions não são suportadas;
\item Não há suporte a Unicode.
\end{itemize}

Para exemplificar o uso do Pyrex, vamos implementar uma função geradora de números primos em Pyrex (listagem \ref{ex:pyrex}).

\lstinputlisting[frame=trBL, caption=Calculando números primos em Pyrex, label=ex:pyrex]{code/primes.pyx}

Vamos analisar o código Pyrex, nas linhas onde ele difere do que seria escrito em Python. Na linha 2 encontramos a primeira peculiaridade: o argumento de entrada kmax é definido como inteiro por meio da expressão \texttt{int kmax}. Em Pyrex, devemos declarar os tipos das variáveis. Nas linhas 3 e 4 também ocorre a declaração dos tipos das variáveis que serão utilizadas na função. Note como é definida uma lista de inteiros. Se uma variável não é declarada, o Pyrex assume que ela é um objeto Python. 

Quanto mais variáveis conseguirmos declarar como tipos básicos de \texttt{C}, mais eficiente será o código \texttt{C} gerado pelo Pyrex. A variável \texttt{result}(linha 5) não é declarada como uma lista de inteiros, pois não sabemos ainda qual será seu tamanho. O restante do código é equivalente ao Python. Devemos apenas notar a preferência do laço \texttt{while} ao invés de um laço do tipo \texttt{for i in range(x)}. Este ultimo seria mais lento devido a incluir a função \texttt{range} do Python.

O próximo passo é gerar a versão em \texttt{C} da listagem \ref{ex:pyrex}, compilar e linká-lo, transformando-o em um módulo Python.
\begin{lstlisting}[language=csh,frame=trBL, caption=Gerando Compilando e linkando, label=ex:pyrexc]
$`
    pyrexc primes.pyx
    :math:`$ gcc -c -fPIC -I/usr/include/python2.4/ primes.c
$` gcc
    -shared primes.o -o primes.so


Agora vamos comparar a performance da nossa função com uma função
em Python razoávelmente bem implementada (Listagem ex:pyrex2).
Afinal temos que dar uma chance ao Python, não?

[frame=trBL, caption=Calculando números primos em Python, label=ex:pyrex2] {code/primes2.py}

Comparemos agora a performance das duas funções para encontrar
todos os números primos menores que 100000. Para esta comparação
utilizaremos o ipython que nos facilita esta tarefa através da
função mágica {\\%timeit}.

    In [1]:from primes import primes In [2]:from primes2 import primes
    as primesp In [3]:%timeit primes(100000) 10 loops, best of 3: 19.6
    ms per loop In [4]:%timeit primesp(100000) 10 loops, best of 3: 512
    ms per loop


Uma das desvantagens do Pyrex é a necessidade de compilar e linkar
os programas antes de poder utilizá-los. Este problema se acentua
se seu programa Python utiliza extensões em Pyrex e precisa ser
distribuido a outros usuários. Felizmente, existe um meio de
automatizar a compilação das extensões em Pyrex, durante a
instalação de um módulo. O pacote setuptools, dá suporte à
compilação automática de extensões em ``Pyrex``. Basta escrever um
script de instalação similar ao da listagem ex:setupix. Uma vez
criado o script (batizado, por exemplo, de ``setupyx.py``), para
compilar a nossa extensão, basta executar o seguinte comando:
``python setupix.py build``.

Para compilar uma extensão Pyrex, o usuário deve naturalmente ter o
Pyrex instalado. Entretanto para facilitar a distribuição destas
extensões, o pacote setuptools, na ausência do Pyrex, procura a
versão em ``C`` gerada pelo autor do programa, e se ela estiver
incluida na distribuição do programa, o setuptools passa então para
a etapa de compilação e linkagem do código ``C``.

[frame=trBL, caption=Automatizando a compilação de extensões em \\texttt{Pyrex} por meio do setuptools, label=ex:setupix] {code/setupyx.py}

    import setuptools from setuptools.extension import Extension


Integração com ``C++``
======================

A integração de programas em Python com bibliotecas em ``C++`` é
normalmente feita por meio ferramentas como SWIG (www.swig.org),
SIP(www.riverbankcomputing.co.uk/sip/) ou Boost.Python
(http://www.boost.org/libs/python/). Estas ferramentas, apesar de
relativamente simples, requerem um bom conhecimento de ``C++`` por
parte do usuário e, por esta razão, fogem ao escopo deste capítulo.
No entanto, o leitor que deseja utilizar código já escrito em
``C++`` pode e deve se valer das ferramentas supracitadas, cuja
documentação é bastante clara.

Elegemos para esta seção sobre ``C++``. uma ferramenta original. O
ShedSkin. {Shedskin}{Shedskin} O ShedSkin
(http://shed-skin.blogspot.com/)se auto intitula
"um compilador de Python para ``C++`` otimizado". O que ele faz ,
na verdade, é converter programas escritos em Python para ``C++``,
permitindo assim grandes ganhos de velocidade. Apesar de seu
potencial, o ShedSkin ainda é uma ferramenta um pouco limitada. Uma
de suas principais limitações, é que o programa em Python a ser
convertido deve possuir apenas variáveis "estáticas", ou seja as
variáveis devem manter-se do mesmo tipo durante toda a execução do
programa. Se uma variável é definida como um número inteiro, nunca
poderá receber um número real, uma lista ou qualquer outro tipo de
dado.

O ShedSkin também não suporta toda a biblioteca padrão do Python na
versão testada (0.0.15). Entretanto, mesmo com estas limitações,
esta ferramenta pode ser muito útil. Vejamos um exemplo: A
integração numérica de uma função, pela regra do trapézio. Esta
regra envolve dividir a área sob a função em um dado intervalo em
multiplos trapézios e somar as suas áreas(figura fig:trapezio.



Matemáticamente, podemos expressar a regra trapezoidal da seguinte
fórmula.

    :math:`$\int_a^b f(x)\;dx \approx \frac{h}{2}(f(a)+f(b))+h\sum_{i=1}^{n-1}f(a+ih),\;\;\;h=\frac{b-a}{n}
$`


(eq:trapezio)

Na listagem ex:trapintloop podemos ver uma implementação simples da
regra trapezoidal.

[frame=trBL, caption=implementação  da regra trapezoidal(utilizando laço for) conforme especificada na equação \\ref{eq:trapezio}, label=ex:trapintloop] {code/trapintloop.py}

Executando o script da Listagem ex:trapintloop (trapintloop.py)
observamos o tempo de execução da integração das duas funções.

    :math:`$ python trapintloop.py
resultado: 16
Tempo: 11.68 seg
resultado: 49029
Tempo: 26.96 seg
\end{lstlisting}

Para converter o script \ref{ex:trapintloop} em \texttt{C++} tudo o que precisamos fazer é:
\begin{lstlisting}[language=csh,frame=trBL, caption=Verificando o tempo de execução em \texttt{C++} ]
$`
    ss trapintloop.py \*\*\* SHED SKIN Python-to-C++ Compiler 0.0.15
    \*\*\* Copyright 2005, 2006 Mark Dufour; License GNU GPL version 2
    or later (See LICENSE) (If your program does not compile, please
    mail me at mark.dufour@gmail.com!!)

    \*WARNING\* trapintloop:13: 'xrange', 'enumerate' and 'reversed'
    return lists for now [iterative type analysis..] \*\* iterations: 2
    templates: 55 [generating c++ code..]
    :math:`$ make run
g++ -O3  -I ...
./trapintloop
resultado: 16
Tempo: 0.06 seg
resultado: 49029
Tempo: 1.57 seg
\end{lstlisting}

Com estes dois comandos, geramos, compilamos e executamos uma versão \texttt{C++} do programa listado em \ref{ex:trapintloop}. O código \texttt{C++} gerado pelo Shed-Skin pode ser conferido na listagem \ref{ex:trapintloop_C} 

Como pudemos verificar, o ganho em performance é considerável. Lamentávelmente, o Shed-Skin não permite criar módulos ``de extensão'' que possam ser importados por outros programas em Python, só programas independentes. Mas esta limitação pode vir a ser superada no futuro.

\lstinputlisting[language=c++,frame=trBL, caption=Código \texttt{C++} gerado pelo Shed-skin a partir do script trapintloopy.py,label=ex:trapintloop_C]{code/trapintloop.cpp}
\section{Integração com a Linguagem \texttt{Fortran}}\index{FORTRAN}
A linguagem \texttt{Fortran} é uma das mais antigas linguagens de programação ainda em uso. Desenvolvida nos anos 50 pela IBM, foi projetada especificamente para aplicações científicas. A sigla \texttt{Fortran} deriva de ``IBM mathematical FORmula TRANslation system''. Dada a sua longa existência, existe uma grande quantidade de código científico escrito em \texttt{Fortran} disponível para uso. Felizmente, a integração do \texttt{Fortran} com o Python pode ser feita de forma extremamente simples, através da ferramenta \texttt{f2py}, que demonstraremos a seguir.
\subsection{\texttt{f2py}}
Esta ferramenta está disponível como parte do Pacote numpy (\url{www.scipy.org}). Para ilustrar o uso do \texttt{f2py}, vamos voltar ao problema da integração pela regra trapezoidal (equação \ref{eq:trapezio}). Como vimos, a implementação deste algoritmo em Python, utilizando um laço \texttt{for}, é ineficiente. Para linguagens compiladas como \texttt{C++} ou \texttt{Fortran}, laços são executados com grande eficiência. Vejamos a performance de uma implementação em \texttt{Fortran} da regra trapezoidal (listagem \ref{ex:trapintf}).

\lstinputlisting[language=fortran,frame=trBL, caption=implementação em \texttt{Fortran} da regra trapezoidal. label=ex:trapintf]{code/trapint.f}

A listagem \ref{ex:compfor} nos mostra como compilar e executar o código da listagem \ref{ex:trapintf}. Este comando de compilação pressupõe que você possua  o \texttt{GCC} (Gnu Compiler Collection) versão 4.0 ou superior. No caso de versões mais antigas deve-se substituir \texttt{gfortran} por \texttt{g77} ou \texttt{f77}.
\begin{lstlisting}[language=csh,frame=trBL, caption= Compilando e executando o programa da listagem \ref{ex:trapintf},label=ex:compfor]
$`
    gfortran -o trapint trapint.f
    :math:`$ time ./trapint
 Resultado:    16.01428
 Resultado:    48941.40

real    0m2.028s
user    0m1.712s
sys     0m0.013s
\end{lstlisting}

Como em \texttt{Fortran} não temos a conveniência de uma função para ``cronometrar'' nossa função, utilizamos o comando \texttt{time} do Unix. Podemos constatar que o tempo de execução é similar ao obtido com a versão em \texttt{C++} (listagem \ref{ex:trapintloop_C}). 

Ainda que não seja estritamente necessário, é recomendável que o código \texttt{Fortran} seja preparado com comentários especiais (\texttt{Cf2py}), antes de ser processado e compilado pelo \texttt{f2py}. A listagem \ref{ex:trapintf} já inclui estes comentários, para facilitar a nossa exposição. Estes comentários nos permitem informar ao \texttt{f2py} as variáveis de entrada e saída de cada função e algumas outras coisas. No exemplo \ref{ex:trapintf}, os principais parametros passados ao \texttt{f2py}, através das linhas de comentário \texttt{Cf2py intent()}, são \texttt{in, out, hide e cache}. As duas primeiras identificam as variáveis de entrada e saída da função ou procedure. O parâmetro \texttt{hide} faz com que a variável de saída \texttt{res}, obrigatoriamente declarada no cabeçalho da procedure em \texttt{Fortran} fique oculta ao ser importada no Python. O parâmetro cache reduz o custo da realocação de  memória em variáveis que são redefinidas dentro de um laço em \texttt{Fortran}.

Antes que possamos ``importar'' nossas funções em \texttt{Fortran} para uso em um programa em Python, precisamos compilar nossos fontes em \texttt{Fortran} com o \texttt{f2py}. A listagem \ref{ex:compf2py} nos mostra como fazer isso.
\begin{lstlisting}[language=csh,frame=trBL, caption= Compilando com \texttt{f2py},label=ex:compf2py]
$`
    f2py -m trapintf -c trapint.f


Uma vez compilados os fontes em ``Fortran`` com o ``f2py``, podemos
então escrever uma variação do script ``trapintloop.py`` (listagem
ex:trapintloop) para verificar os ganhos de performance. A listagem
ex:trapintloopcomp contém nosso script de teste.
[frame=trBL, caption=Script para comparação entre Python e \\texttt{Fortran} via \\texttt{f2py},label=ex:trapintloopcomp] {code/trapintloopcomp.py}

A listagem ex:trapintloopcomp contem uma versão da regra
trapezoidal em Python puro e importa a função ``tint`` do nosso
programa em ``Fortran``. A função em ``Fortran`` é chamado de duas
formas: uma para integrar funções implementadas em Python (na forma
funções ``lambda``) e outra substituindo as funções ``lambda``
pelos seus equivalentes em ``Fortran``.

Executando ``trapintloopcomp.py``, podemos avaliar os ganhos em
performance (listagem ex:comp). Em ambas as formas de utilização da
função ``ftint``, existem chamadas para objetos Python dentro do
laço ``DO``. Vem daí a degradação da performance, em relação à
execução do programa em ``Fortran``, puramente.

    :math:`$ python trapintloopcomp.py
resultado: 16
Tempo: 13.29 seg
resultado: 49029
Tempo: 29.14 seg
tempo do Fortran com funcoes em Python
resultado: 16
Tempo: 7.31 seg
resultado: 48941
Tempo: 24.95 seg
tempo do Fortran com funcoes em Fortran
resultado: 16
Tempo: 4.85 seg
resultado: 48941
Tempo: 6.42 seg
\end{lstlisting}

Neste ponto, devemos parar e fazer uma reflexão. Será justo comparar a pior implementação possível em Python (utilizando laços \texttt{for}), com códigos compilados em \texttt{C++} e \texttt{Fortran}? Realmente, não é justo. Vejamos como se sai uma implementação competente  da regra trapezoidal em Python (com uma ajudinha do pacote numpy). Consideremos a listagem \ref{ex:trapintvect}.

\lstinputlisting[frame=trBL, caption=Implementação vetorizada da regra trapezoidal,label=ex:trapintvect]{code/trapintvect.py}

Executando a listagem \ref{ex:trapintvect}, vemos que a implementação vetorizada em Python ganha (0.28 e 2.57 segundos)de nossas soluções utilizando \texttt{f2py}. 

Da mesma forma que com o \texttt{Pyrex}, podemos distribuir programas escritos em Python com extensões escritas em \texttt{Fortran}, com a ajuda do pacote setuptools. Na listagem \ref{ex:setupf2py} vemos o exemplo de como escrever um setup.py para este fim. Neste exemplo, temos um \texttt{setup.py} extrememente limitado, contendo apenas os parâmetros necessarios para a compilação de uma extensão denominada \texttt{flib}, a partir de uma programa em \texttt{Fortran}, localizado no arquivo \texttt{flib.f}, dentro do pacote ``\texttt{meupacote}''. Observe, que ao definir módulos de extensão através da função Extension, podemos passar também outros argumentos, tais como outras bibliotecas das quais nosso código dependa.
\begin{lstlisting}[frame=trBL, caption=\texttt{setup.py} para distribuir programas com extensões em \texttt{Fortran} ,label=ex:setupf2py]
import ez_setup
ez_setup.use_setuptools()
import setuptools
from numpy.distutils.core import setup, Extension
flib = Extension(name='meupacote.flib',
                        libraries=[],
                        library_dirs=[],
                        f2py_options=[],
                        sources=['meupacote/flib.f']
                        )
setup(name = 'mypackage',
      version = '0.3.5',
      packages = ['meupacote'],
      ext_modules = [flib]
     )
\end{lstlisting}

\section{A Píton que sabia Javanês --- Integração com Java}\index{Java}
Peço licença ao mestre Lima Barreto, para parodiar o título do seu excelente conto, pois não pude resistir à analogia. A linguagem Python, conforme descobrimos ao longo deste livro, é extremamente versátil, e deve esta versatilidade, em parte, à sua biblioteca padrão. Entretanto existe uma outra linguagem que excede em muito o Python (ao menos atualmente), na quantidade de módulos disponíveis para os mais variados fins: o \texttt{Java}.

A linguagem \texttt{Java} tem, todavia, contra si uma série de fatores: A complexidade de sua sintaxe rivaliza com a do \texttt{C++}, e não é eficiente, como esperaríamos que o fosse, uma linguagem compilada, com tipagem estática. Mas todos estes aspectos negativos não são suficientes para anular as vantagens do vasto número de bibliotecas disponíveis e da sua portabilidade.

Como poderíamos capturar o que o \texttt{Java} tem de bom, sem levar como ``brinde'' seus aspectos negativos? É aqui que entra o \texttt{Jython}.

O \texttt{Jython} é uma implementação completa do Python 2.2\footnote{O desenvolvimento do \texttt{Jython continua, mas não se sabe ainda quando alcançará o CPython (implementação em \texttt{C} do Python).}} em \texttt{Java}. Com o \texttt{Jython} programadores \texttt{Java} podem embutir o Python em seus aplicativos e applets e nós, programadores Python, podemos utilizar, livremente, toda (ou quase toda) a biblioteca padrão do Python com classes em \texttt{Java}. Além destas vantagens, O \texttt{Jython} também é uma linguagem Open Source, ou seja de código aberto.

\subsection{O interpretador Jython}\label{sec:jython}
\index{Jython}

Para iniciar nossa aventura com o \texttt{Jython}, precisaremos instalá-lo, e ter instalada uma máquina virtual \texttt{Java} (ou JVM)  versão 1.4 ou mais recente.

Vamos tentar usá-lo como usaríamos o interpretador Python e ver se notamos alguma diferença. 
\begin{lstlisting}[frame=trBL, caption=Usando o interpretador \texttt{Jython} ,label=lst:int-jython]
$`
    jython Jython 2.1 on java1.4.2-01 (JIT: null) Type "copyright",
    "credits" or "license" for more information. print 'hello world'
    hello world import math() dir(math) ['acos', 'asin', 'atan',
    'atan2', 'ceil', 'classDictInit', 'cos', 'cosh', 'e', 'exp',
    'fabs', 'floor', 'fmod', 'frexp', 'hypot', 'ldexp', 'log', 'log10',
    'modf', 'pi', 'pow', 'sin', 'sinh', 'sqrt', 'tan', 'tanh'] math.pi
    3.141592653589793


Até agora, tudo parece funcionar muito bem. Vamos tentar um exemplo
um pouco mais avançado e ver de que forma o ``Jython`` pode
simplificar um programa em ``Java``.

    import javax.swing.JOptionPane; class testDialog public static void
    main ( String[] args ) javax.swing.JOptionPane.showMessageDialog (
    null, "Isto e um teste." );


A versão apresentada na listagem lst:Swingjava está escrita em
``Java``. Vamos ver como ficaria a versão em ``Jython``.

    import javax.swing.JOptionPane
    javax.swing.JOptionPane.showMessageDialog(None,"Isto e um
    teste.")


Podemos observar, na listagem lst:Swingjython, que eliminamos a
verborragia característica do ``Java``, e que o programa em
``Jython`` ficou bem mais "pitônico". Outro detalhe que vale a pena
comentar, é que não precisamos compilar (mas podemos se quisermos)
o código em ``Jython``, como seria necessário com o ``Java``. Só
isto já é uma grande vantagem do ``Jython``. Em suma, utilizado-se
o ``Jython`` ao invés do ``Java``, ganha-se em produtividade duas
vezes: Uma, ao escrever menos linhas de código e outra, ao não ter
que recompilar o programa a cada vez que se introduz uma pequena
modificação.

Para não deixar os leitores curiosos acerca da finalidade do código
apresentado na listagem lst:Swingjython, seu resultado encontra-se
na figura fig:Swing-jython.



Criando "Applets" em Jython
---------------------------

Para os conhecedores de ``Java``, o ``Jython`` pode ser utilizado
para criar "servlets", "beans" e "applets" com a mesma facilidade
que criamos um aplicativo em ``Jython``. Vamos ver um exemplo de
"applet"(listagem lst:applet-jython).

    import java.applet.Applet; class appletp ( java.applet.Applet ):
    def paint ( self, g ): g.drawString ( "Eu sou um Applet Jython!",
    5, 5 )


Para quem não conhece ``Java``, um applet é um mini-aplicativo
feito para ser executado dentro de um Navegador (Mozilla, Opera
etc.) que disponha de um "plug-in" para executar código em
``Java``. Portanto, desta vez, precisaremos compilar o código da
listagem lst:applet-jython para que a máquina virtual ``Java``
possa executá-lo. Para isso, salvamos o código e utilizamos o
compilador do ``Jython``, o ``jythonc``.

    jythonc -deep -core -j appletp.jar appletp.py processing appletp

    Required packages: java.applet

    Creating adapters:

    Creating .java files: appletp module appletp extends
    java.applet.Applet

    Compiling .java to .class... Compiling with args:
    ['/opt/blackdown-jdk-1.4.2.01/bin/javac', '-classpath',
    '/usr/share/jython/lib/jython-2.1.jar:/usr/share/libreadline-java/lib/libreadline-java.jar:.:./jpywork::/usr/share/jython/tools/jythonc:/home/fccoelho/Documents/LivroPython/.:/usr/share/jython/Lib',
    './jpywork/appletp.java'] 0 Note: ./jpywork/appletp.java uses or
    overrides a deprecated API. Note: Recompile with -deprecation for
    details.

    Building archive: appletp.jar Tracking java dependencies:


Uma vez compilado nosso applet, precisamos "embuti-lo" em um
documento HTML (listagem lst:htmlapp. Então, basta apontar nosso
navegador para este documento e veremos o applet ser executado.

    html head meta content="text/html; charset=ISO-8859-1"
    http-equiv="content-type" titlejython applet/title /head body Este
    eacute; o seu applet em Jython:br br br center applet
    code="appletp" archive="appletp.jar" name="Applet em Jython"
    alt="This browser doesn't support JDK 1.1 applets." align="bottom"
    height="50" width="160" PARAM NAME="codebase" VALUE="." h3Algo saiu
    errado ao carregar este applet./h3 /applet /center br br /body
    /html


Na compilação, o código em ``Jython`` é convertido completamente em
código ``Java`` e então compilado através do compilador ``Java``
padrão.

Exercícios
==========


#.
   Compile a listagem ex:weaveloop com o Shed-skin e veja se há ganho
   de performance. Antes de compilar, remova as linhas associadas ao
   uso do Weave.

#.
   Após executar a função primes (listagem ex:pyrex), determine o
   tamanho da lista de números primos menor do que 1000. Em seguida
   modifique o código Pyrex, declarando a variável results como uma
   lista de inteiros, e eliminando a função ``append`` do laço
   ``while``. Compare a performance desta nova versão com a da versão
   original.



