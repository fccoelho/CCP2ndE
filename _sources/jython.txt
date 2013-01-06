.. role:: math(raw)
   :format: html latex

{Jython: A python que sabia Javanês} {P} {eço} licença ao mestre
Lima Barreto, para parodiar o título do seu excelente conto, pois
não pude resistir à analogia. A linguagem Python, conforme
descobrimos ao longo deste livro, é extremamente versátil, e deve
esta versatilidade, em parte, à sua biblioteca padrão. Entretanto
existe uma outra linguagem que excede em muito o Python (ao menos
atualmente) na quantidade de módulos disponíveis para os mais
variados fins: o Java.

A linguagem Java tem contra si uma série de fatores: A complexidade
de sua sintaxe rivaliza com a do C++, é uma linguagem proprietária,
e não é eficiente como esperaríamos que uma linguagem compilada,
com tipagem estática fosse. Mas todos estes aspectos negativos não
são suficientes para anular as vantagens da sua grande biblioteca e
da sua portabilidade.

Como poderíamos capturar o que o java tem de bom sem levar como
"brinde" seus aspectos negativos? É aqui que entra o Jython.

O Jython é uma implementação completa do Python 2.1 [1]_ em Java.
Com o Jython programadores Java podem embutir o python em seus
aplicativos e applets e nós, programadores Python podemos utilizar
misturar livremente toda (ou quase toda) a biblioteca padrão do
Python com classes em Java. Além destas vantagens, O Jython também
é uma linguagem Open Source.

O interpretador Jython
======================

Para iniciar nossa aventura com o Jython, precisaremos instalá-lo,
e precisamos ter instalada uma máquina virtual Java (ou JVM) versão
1.4 ou mais recente.

Vamos tentar usá-lo como usaríamos o interpretador python e ver se
notamos alguma diferença.

    :math:`$ jython
Jython 2.1 on java1.4.2-01 (JIT: null)
Type "copyright", "credits" or "license" for more information.
>>> print 'hello world'
hello world
>>> import math()
>>> dir(math)
['acos', 'asin', 'atan', 'atan2', 'ceil', 'classDictInit', 'cos', 'cosh', 'e', 'exp', 'fabs', 'floor', 'fmod', 'frexp', 'hypot', 'ldexp', 'log', 'log10', 'modf', 'pi', 'pow', 'sin', 'sinh', 'sqrt', 'tan', 'tanh']
>>> math.pi
3.141592653589793
\end{lstlisting}

Até agora tudo parece funcionar muito bem. Vamos tentar um exemplo um pouco mais avançado e ver de que forma o Jython pode simplificar um programa em java.
\begin{lstlisting}[language=Java,frame=trBL, caption=Um programa simples em Java usando a classe Swing. ,label=lst:Swing-java]
import javax.swing.JOptionPane;
class testDialog {
   public static void main ( String[] args ) {
      javax.swing.JOptionPane.showMessageDialog ( null, "Isto e um teste." );
   }
}
\end{lstlisting}

A versão apresentada na listagem \ref{lst:Swing-java} está escrita em Java. Vamo ver como ficaria a versão em Jython.
\begin{lstlisting}[frame=trBL, caption=O mesmo programa da listagem \ref{lst:Swing-java} em Jython.,label=lst:Swing-jython]
>>> import javax.swing.JOptionPane
>>> javax.swing.JOptionPane.showMessageDialog(None,"Isto e um teste.")
\end{lstlisting}

Podemos observar na listagem \ref{lst:Swing-jython} que eliminamos a verborragia característica do Java, e o programa em Jython ficou bem mais "pitônico". Outro detalhe que vale a pena comentar, é que não precisamos compilar o código em Jython, com seria necessário com o Java. Só isto já é uma grande vantagem do Jython. Em suma, utilizado-se o Jython ao invés do Java ganha-se em produtividade duas vezes: Uma ao escrever menos linhas de código e outra, ao não ter que recompilar o programa a cada vez que se introduz uma pequena modificação. 

Para não deixar os leitores curiosos acerca da finalidade do código apresentado na listagem \ref{lst:Swing-jython}, Seu resultado encontra-se na figura \ref{fig:Swing-jython}.

\begin{figure}
    \centering
    \includegraphics[bb=0 0 269 127]{jyswing.eps}
% jyswing.jpg: 72dpi, width=9.49cm, height=4.48cm, bb=0 0 269 127
    \caption{Saída da listagem \ref{lst:Swing-jython}.}
    \label{fig:Swing-jython}
\end{figure}

\section{Criando ``Applets" em Jython}
Para os conhecedores de Java, o Jython pode ser utilizado para criar ``servlets", ``beans" e ``applets" com a mesma facilidade com que criamos um aplicativo em Jython. Vamos ver um exemplo de ``applet"(listagem \ref{lst:applet-jython}).
\begin{lstlisting}[frame=trBL, caption=Criando um applet em Jython ,label=lst:applet-jython]
import java.applet.Applet;
class appletp ( java.applet.Applet ):
   def paint ( self, g ):
      g.drawString ( "Eu sou um Applet Jython!", 5, 5 )
\end{lstlisting}

Para quem não conhece Java, um applet é um mini aplicativo feito para ser executado dentro de um Navegador (Mozilla, Opera etc.) que disponha de um ``plug-in" para executar código em Java. Portanto, Desta vez precisaremos compilar o código da listagem \ref{lst:applet-jython} para que a máquina virtual Java possa executá-lo. Para isso, salvamos o código  utilizaremos o compilador do Jython, \texttt{jythonc}. 
\begin{lstlisting}[language= Ksh,frame=trBL, caption= Compilando appletp.py ,label=lst:jythonc]
$`
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


Uma vez compilado nosso applet, precisamos precisamos embuti-lo" em
um documento HTML (listagem lst:htmlapp. Então basta apontar nosso
navegador para este documento e veremos o applet ser executado.

    html head meta content="text/html; charset=ISO-8859-1"
    http-equiv="content-type" titlejython applet/title /head body Este
    eacute; o seu applet em Jython:br br br center applet
    code="appletp" archive="appletp.jar" name="Applet em Jython"
    alt="This browser doesn't support JDK 1.1 applets." align="bottom"
    height="50" width="160" PARAM NAME="codebase" VALUE="." h3Algo saiu
    errado ao carregar este applet./h3 /applet /center br br /body
    /html


Na compilação, o código em Jython é convertido completamente em
código Java e então compilado através do compilador Java padrão.

.. [1] 
   Ao final de 2005 está prometida compatibilidade com o Python 2.3


