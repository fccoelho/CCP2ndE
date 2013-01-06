.. role:: math(raw)
   :format: html latex

{Criando Gráficos em Python}(ch:plot)
{Introdução à produção de figuras de alta qualidade utilizando o pacote matplotlib. \\textbf{Pré-requisitos:} Capítulo \\ref{cap:intro}.}

{E} {xiste} um número crescente de módulos para a criação de
gráficos científicos com Python. Entretanto, até o momento da
publicação deste livro, nenhum deles fazia parte da distribuição
oficial do Python.

Para manter este livro prático e conciso, foi necessário escolher
apenas um dos módulos de gráficos disponíveis, para apresentação
neste capítulo.

O critério de escolha levou em consideração os principais valores
da filosofia da linguagem Python (ver listagem ex:fil):
simplicidade, elegância, versatilidade, etc. À época, a aplicação
destes critérios nos deixou apenas uma opção: o módulo
matplotlib [1]_.

Introdução ao Matplotlib
========================

O módulo matplotlib (MPL) é voltado para a geração de gráficos
bi-dimensionais de vários tipos, e se presta para utilização tanto
interativa quanto em scripts, aplicações web ou integrada a
interfaces gráficas (GUIs) de vários tipos.

A instalação do MPL também segue o padrão de simplicidade do Python
(listagem ex:instmat). Basta baixar o pacote **tar.gz** do sítio,
descompactar e executar o comando de instalação.

{lstlisting} [ caption=Instalando o matplotlib ,label=ex:instmat]
:math:`$ python setup.py install
\end{lstlisting}

O MPL procura tornar simples tarefas de plotagem, simples e tarefas complexas, possíveis (listagem\ref{ex:hist}, figura \ref{fig:hist}). Os gráficos gerados podem ser salvos em diversos formatos: jpg, png, ps, eps e svg. Ou seja, o MPL exporta em formatos raster e vetoriais (svg) o que torna sua saída adequada para inserção em diversos tipos de documentos.
\begin{lstlisting}[caption=Criando um histograma no modo interativo ,label=ex:hist]
>>> from pylab import *
>>> from numpy.random import *
>>> x=normal(0,1,1000)
>>> hist(x,30)
...
>>> show()
\end{lstlisting}

\begin{figure}
   \centering
   \includegraphics[width=10cm]{hist.png}
   \caption{Histograma simples a partir da listagem \ref{ex:hist}}
   \label{fig:hist}
\end{figure}

Podemos também embutir a saída gráfica do MPL em diversas GUIs: GTK, WX e TKinter. Naturalmente a utilização do MPL dentro de uma GUI requer que os módulos adequados para o desenvolvimento com a GUI em questão estejam instalados\footnote{Veja no sitio do MPL os pré-requisitos para cada uma das GUIs}.

Para gerar os gráficos e se integrar a interfaces gráficas, o MPL se utiliza de diferentes ``backends'' de acordo com nossa escolha (Wx, GTK, Tk, etc).

\subsection{Configurando o MPL}
O MPL possui valores \textit{default} para propriedades genéricas dos gráficos gerados. Estas configurações ficam em um arquivo texto chamado \textbf{matplotlibrc}, que deve ser copiado da distribuição do MPL, editado conforme as preferências do usuário e renomeado para \texttt{$`:math:`$/.matplotlibrc}, ou seja, deve ser colocado como um arquivo oculto no diretório \textbf{home} do usuário.

A utilização de configurações padrão a partir do \textbf{matplotlibrc} é mais útil na utilização interativa do MPL, pois evita a necessidade de configurar cada figura de acordo com as nossas preferências, a cada vez que usamos o MPL\footnote{Para uma descrição completa das características de gráficos que podem ser configuradas, veja o ememplo de \textbf{matplotlibrc} que é fornecido com a distribuição do MPL.}.



\subsection{Comandos Básicos}
Os comandos relacionados diretamente à geração de gráficos são bastante numerosos(tabela \ref{tab:plot}); mas, além  destes, existe um outro conjunto ainda maior de comandos, voltados para o ajuste fino de detalhes dos gráficos (ver tabela \ref{tab:lineprop}, para uma amostra), tais como tipos de linha, símbolos, cores, etc.
\begin{table}
\centering
\begin{tabular}{l|l}
\hline \texttt{bar} & Gráfico de barras \\ 
\hline \texttt{cohere} & Gráfico da função de coerência \\ 
\hline \texttt{csd} & Densidade espectral cruzada \\ 
\hline \texttt{errorbar} & Gráfico com barras de erro \\ 
\hline \texttt{hist} & Histograma \\ 
\hline \texttt{imshow} & Plota imagens \\ 
\hline \texttt{pcolor} & Gráfico de pseudocores \\ 
\hline \texttt{plot} & Gráfico de linha \\ 
\hline \texttt{psd} & Densidade espectral de potência \\ 
\hline \texttt{scatter} & Diagrama de espalhamento \\ 
\hline \texttt{specgram} & Espectrograma \\ 
\hline \texttt{stem} & Pontos com linhas verticais \\ 
\hline 
\end{tabular} 
\caption{Principais comandos de plotagem do MPL}\label{tab:plot}
\end{table}
Uma explicação mais detalhada dos comandos apresentados na tabela \ref{tab:plot}, será dada nas próximas seções no contexto de exemplos.

\section{Exemplos Simples}
\subsection{O comando \texttt{plot}}
O comando plot é um comando muito versátil, pode receber um número variável de argumentos, com diferentes saídas.
\begin{lstlisting}[frame=trBL, caption=Gráfico de linha ,label=ex:linha]
from pylab import *
plot([1,2,3,4])
show()
\end{lstlisting}
\begin{figure}
   \centering
   \includegraphics[width=10cm]{line.png}
   \caption{Reta simples a partir da listagem \ref{ex:linha}}
   \label{fig:line}
\end{figure} 
Quando \texttt{plot} recebe apenas uma sequência de números (lista, tupla ou array), ele gera um gráfico (listagem \ref{ex:linha}) utilizando os valores recebidos como valores de \textbf{y} enquanto que os valores de \textbf{x} são as posições destes valores na sequência.

Caso duas sequências de valores sejam passadas para \texttt{plot} (listagem \ref{ex:ponto}), a primeira é atribuida a \textbf{x} e a segunda a \textbf{y}. Note que, neste exemplo, ilustra-se também a especificação do tipo de saída gráfica como uma sequência de pontos. O parâmtero \texttt{'ro'} indica que o símbolo a ser usado é um círculo vermelho.
\begin{lstlisting}[frame=trBL, caption=Gráfico de pontos com valores de \textbf{x} e \textbf{y} especificados. ,label=ex:ponto]
from pylab import *
plot([1,2,3,4], [1,4,9,16], 'ro')
axis([0, 6, 0, 20])
savefig('ponto.png')
show()
\end{lstlisting}
\begin{figure}
   \centering
   \includegraphics[width=10cm]{ponto.png}
   \caption{Gráfico com símbolos circulares a partir da listagem \ref{ex:ponto}}
   \label{fig:ponto}
\end{figure}
Na linha 3 da listagem \ref{ex:ponto} especifica-se também os limites dos eixos como uma lista de quatro elementos: os valores mínimo e máximo dos eixos \textbf{x} e \textbf{y}, respectivamente. Na linha 4, vemos o comando \texttt{savefig} que nos permite salvar a figura gerada no arquivo cujo nome é dado pela string recebida. O tipo de arquivo é determinado pela extensão (.png, .ps, .eps, .svg, etc).

O MPL nos permite controlar as propriedades da linha que forma o gráfico. Existe mais de uma maneira de determinar as propriedades das linhas geradas pelo comando \texttt{plot}. Uma das maneiras mais diretas é através dos argumentos listados na tabela \ref{tab:lineprop}. Nos diversos exemplos apresentados neste capítulo, alguns outros métodos serão apresentados e explicados\footnote{Para maiores detalhes consulte a documentação do MPL (http://matplotlib.sourceforge.net).}.

Vale a pena ressaltar que o comando \texttt{plot} aceita, tanto listas, quanto arrays dos módulos \texttt{Numpy}, \texttt{Numeric} ou \texttt{numarray}. Na verdade todas a sequências de números passadas para o comando \texttt{plot} são convertidas internamente para \texttt{arrays}.
\begin{table}
\centering
\caption{Argumentos que podem ser passados juntamente com a função plot para controlar propriedades de linhas.}\label{tab:lineprop} 
\begin{tabular}{l|l}
Propriedade & Valores \\ 
\hline
\texttt{alpha} & transparência (0-1) \\ 
\texttt{antialiased} & true | false \\ 
\texttt{color} & Cor: b,g,r,c,m,y,k,w \\ 
\texttt{label} & legenda \\ 
 \texttt{linestyle} & \verb|-- : -. -| \\ 
\texttt{linewidth} & Espessura da linha (pontos) \\ 
\texttt{marker} & \verb|+ o . s v x > < ^|\\ 
\texttt{markeredgewidth} & Espessura da margem do símbolo \\ 
\texttt{markeredgecolor} & Cor da margem do símbolo \\ 
\texttt{markerfacecolor} & Cor do símbolo \\ 
\texttt{markersize} & Tamanho do símbolo (pontos) \\ 
\hline
\end{tabular} 
\end{table} 
\subsection{O Comando \texttt{subplot}}
O MPL trabalha com o conceito de \textit{figura} independente do de \textit{eixos}. O comando \texttt{gcf()} retorna a figura atual, e o comando \texttt{gca()} retorna os eixos atuais. Este detalhe nos permite posicionar os eixos de um gráfico em posições arbitrárias dentro da figura. Todos os comandos de plotagem são realizados nos eixos atuais. Mas, para a maioria dos usuários, estes detalhes são transparentes, ou seja, o usúário não precisa tomar conhecimento deles. A listagem \ref{ex:subplot} apresenta uma figura com dois eixos feita de maneira bastante simples.
\lstinputlisting[frame=trBL, caption=Figura com dois gráficos utilizando o comando subplot. ,label=ex:subplot]{code/subplot.py}
%\begin{lstlisting}[float,frame=trBL, caption=Figura com dois gráficos utilizando o comando subplot. ,label=ex:subplot]

%\end{lstlisting}
\begin{figure}
   \centering
   \includegraphics[width=10cm]{subplot.png}
   \caption{Figura com dois gráficos utilizando o comando subplot, a partir da listagem \ref{ex:subplot}}
   \label{fig:subplot}
\end{figure}

O comando \texttt{figure(1)}, na linha 11 da listagem \ref{ex:subplot}, é opcional, mas pode vir a ser importante quando se deseja criar múltiplas figuras, antes de dar o comando \texttt{show()}. Note pelo primeiro comando \texttt{plot} da listagem \ref{ex:subplot}, que o comando \texttt{plot} aceita mais de um par \textbf{(x,y)}, cada qual com seu tipo de linha especificado independentemente.
\subsection{Adicionando Texto a Gráficos}
O MPL nos oferece quatro comandos para a adição de texto a figuras: \texttt{title}, \texttt{xlabel}, \texttt{ylabel}, e \texttt{text}. O três primeiros adicionam título e nomes para os eixos \textbf{x} e \textbf{y}, respectivamente.

Todos os comandos de inserção de texto aceitam argumentos (tabela \ref{tab:texto}) adicionais para formatação do texto.
\begin{table}
\caption{Argumentos opcionais dos comandos de inserção de texto.}\label{tab:texto}
\begin{tabular}{l|l}
\textbf{Propriedades} & \textbf{Valores} \\
\hline
alpha & Transparência (0-1) \\ 
color & Cor \\ 
fontangle & italic | normal | oblique \\ 
fontname & Nome da fonte \\ 
fontsize & Tamanho da fonte \\ 
fontweight & normal | bold | light4 \\ 
horizontalalignment & left | center | right \\ 
rotation & horizontal | vertical \\ 
verticalalignment & bottom | center | top \\ 
\hline
\end{tabular} 
\end{table} 
O MPL também nos permite utilizar um subconjunto da linguagem \TeX  para formatar expressões matemáticas (Listagem \ref{ex:mathtext} e figura \ref{fig:mathtext}. Para inserir expressões em \TeX, é necessário que as strings contendo as expressões matemáticas sejam ``raw strings''\footnote{exemplo: r'raw string'}, e delimitadas por cifrões(\$`).
[frame=trBL, caption=Formatando texto e expressões matemáticas ,label=ex:mathtext] {code/mathtext.py}



Exemplos Avançados
==================

O MPL é capaz produzir uma grande variedade gráficos mais
sofisticados do que os apresentados até agora. Explorar todas as
possibilidades do MPL, foge ao escopo deste texto, mas diversos
exemplos de outros tipos de gráficos serão apresentados junto com
os exemplos da segunda parte deste livro.

Mapas
-----

O matplotlib pode ser extendido para plotar mapas. Para isso
precisamos instalar o Basemap toolkit. Se você já instalou o
matplotlib, basta baixar o arquivo tar.gz do Basemap, descompactar
para um diretório e executar o já conhecido
``python setup.py install``.

O Basemap já vem com um mapa mundi incluído para demonstração.
Vamos utilizar este mapa em nosso exemplo (Listagem ex:mapa).

[frame=trBL, caption=Plotando o globo terrestre,label=ex:mapa] {code/mapa.py}



Na listagem fig:mapa, criamos um objeto map, que é uma instância,
da classe Basemap (linha 4). A classe Basemap possui diversos
atributos, mas neste exemplo estamos definindo apenas alguns como a
projeção (Robinson), coordenadas do centro do mapa, {lat\\\_0} e
{lon\\\_0}, resolução dos contornos, ajustada para baixa, e tamanho
mínimo de detalhes a serem desenhados, {area\\\_thresh}, definido
como :math:`$1000 km^2$`.

.. [1]  http://matplotlib.sourceforge.net


