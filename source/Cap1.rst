.. role:: math(raw)
   :format: html latex

.. _prefacio:
Prefácio: Computação Científica
===============================

    Da Computação Científica e sua definição pragmática. Do porquê esta se diferencia, em metas e ferramentas, da Ciência da Computação.

Computação científica não é uma área do conhecimento muito bem definida. A definição utilizada neste livro é a de uma área de atividade/conhecimento que envolve a utilização de ferramentas computacionais (software) para a solução de problemas científicos em áreas da ciência não necessariamente ligadas à disciplina da ciência da computação, ou seja, a computação para o restante da comunidade científica.

Nos últimos tempos, a computação em suas várias facetas, tem se tornado uma ferramenta universal para quase todos os segmentos da atividade humana. Em decorrência, podemos encontrar produtos computacionais desenvolvidos para uma enorme variedade de aplicações, sejam elas científicas ou não. No entanto, a diversidade de aplicações científicas da computação é quase tão vasta quanto o próprio conhecimento humano. Por isso, o cientista frequentemente se encontra com problemas para os quais as ferramentas computacionais adequadas não existem.

No desenvolvimento de softwares científicos, temos dois modos principais de produção de software: o desenvolvimento de softwares comerciais, feito por empresas de software que contratam programadores profissionais para o desenvolvimento de produtos voltados para uma determinada aplicação científica, e o desenvolvimento feito por cientistas (físicos, matemáticos, biólogos, etc., que não são programadores profissionais), geralmente de forma colaborativa através do compartilhamento de códigos fonte.

Algumas disciplinas científicas, como a estatística por exemplo, representam um grande mercado para o desenvolvimento de softwares comerciais genéricos voltados para as suas principais aplicações, enquanto que outras disciplinas científicas carecem de massa crítica (em termos de número de profissionais) para estimular o desenvolvimento de softwares comerciais para a solução dos seus problemas computacionais específicos. Como agravante, o desenvolvimento lento e centralizado de softwares comerciais, tem se mostrado incapaz de acompanhar a demanda da comunidade científica, que precisa ter acesso a métodos que evoluem a passo rápido. Além disso, estão se multiplicando as disciplinas científicas que têm como sua ferramenta principal de trabalho os métodos computacionais, como por exemplo a bio-informática, a modelagem de sistemas complexos, dinâmica molecular e etc.

Cientistas que se vêem na situação de terem de desenvolver softwares para poder viabilizar seus projetos de pesquisa, geralmente têm de buscar uma formação improvisada em programação e produzem programas que tem como característica básica serem minimalistas, ou seja, os programas contêm o mínimo número de linhas de código possível para resolver o problema em questão. Isto se deve à conjugação de dois fatos: 1) O cientista raramente possui habilidades como programador para construir programas mais sofisticados e 2) Frequentemente o cientista dispõe de pouco tempo entre suas tarefas científicas para dedicar-se à programação.

Para complicar ainda mais a vida do cientista-programador, as linguagens de programação tradicionais foram projetadas e desenvolvidas por programadores para programadores e voltadas ao desenvolvimento de softwares profissionais com dezenas de milhares de linhas de código. Devido a isso, o número de linhas de código mínimo para escrever um programa científico nestas linguagens é muitas vezes maior do que o número de linhas de código associado com a resolução do problema em questão.

Quando este problema foi percebido pelas empresas de software científico, surgiu uma nova classe de software, voltado para a demanda de cientistas que precisavam implementar métodos computacionais específicos e que não podiam esperar por soluções comerciais.

.. index:: Matlab, Mathematica, R

Esta nova classe de aplicativos científicos, geralmente inclui uma linguagem de programação de alto nível, por meio da qual os cientistas podem implementar seus próprios algoritmos, sem ter que perder tempo tentando explicar a um programador profissional o que, exatamente, ele deseja. Exemplos destes produtos incluem MATLAB, Mathematica, Maple, entre outros. Nestes aplicativos, os programas são escritos e executados dentro do próprio aplicativo, não podendo ser executados fora dos mesmos. Estes ambientes, entretanto, não possuem várias características importantes das linguagens de programação: Não são portáteis, ou seja, não podem ser levados de uma máquina para a outra e executados a menos que a máquina-destino possua o aplicativo gerador do programa (MATLAB, etc.) que custa milhares de dólares por licença, Os programas não podem ser portados para outra plataforma computacional para a qual não exista uma versão do aplicativo gerador. E, por último e não menos importante, o programa produzido pelo cientista 
não lhe pertence, pois, para ser executado, necessita de código proprietário do ambiente de desenvolvimento comercial.

Este livro se propõe a apresentar uma alternativa livre (baseada em Software Livre), que combina a facilidade de aprendizado e rapidez de desenvolvimento, características dos ambientes de desenvolvimento comerciais apresentados acima, com toda a flexibilidade das linguagens de programação tradicionais. Programas científicos desenvolvidos inteiramente com ferramentas de código aberto tem a vantagem adicional de serem plenamente escrutináveis pelo sistema de revisão por pares ("peer review"), mecanismo central da ciência para validação de resultados.

A linguagem Python apresenta as mesmas soluções propostas pelos ambientes de programação científica, mantendo as vantagens de ser uma linguagem de programação completa e de alto nível.

Apresentando o Python
---------------------

O Python é uma linguagem de programação dinâmica e orientada a objetos, que pode ser utilizada no desenvolvimento de qualquer tipo de aplicação, científica ou não. O Python oferece suporte à integração com outras linguagens e ferramentas, e é distribuido com uma vasta biblioteca padrão. Além disso, a linguagem possui uma sintaxe simples e clara, podendo ser aprendida em poucos dias. O uso do Python é frequentemente associado com grandes ganhos de produtividade e ainda, com a produção de programas de alta qualidade e de fácil manutenção.

A linguagem de programação Python [1]_ começou a ser desenvolvida ao final dos anos 80, na Holanda, por Guido van Rossum. Guido foi o principal autor da linguagem e continua até hoje desempenhando um papel central no direcionamento da evolução. Guido é reconhecido pela comunidade de usuários do Python como "Benevolent Dictator For Life" (BDFL), ou ditador benevolente vitalício da linguagem.

A primeira versão pública da linguagem (0.9.0) foi disponibilizada. Guido continou avançando o desenvolvimento da linguagem, que alcançou a versão 1.0 em 1994. Em 1995, Guido emigrou para os EUA levando a responsabilidade pelo desenvolvimento do Python, já na versão 1.2, consigo. Durante o período em que Guido trabalhou para o CNRI [2]_, o Python atingiu a versão 1.6, que foi rápidamente seguida pela versão 2.0. A partir desta versão, o Python passa a ser distribuído sob a Python License, compatível com a GPL [3]_, tornando-se oficialmente software livre. A linguagem passa a pertencer oficialmente à Python Software Foundation. Apesar da implementação original do Python ser desenvolvida na Linguagem C (CPython), Logo surgiram outras implementações da Linguagem, inicialmente em Java (Jython [4]_), e depois na própria linguagem Python (PYPY [5]_), e na plataforma ``.NET`` (IronPython [6]_).

Dentre as várias características da linguagem que a tornam interessante para computação científica, destacam-se:

Multiplataforma:
    O Python pode ser instalado em qualquer plataforma computacional: Desde PDAs e celulares até supercomputadores com processamento paralelo, passando por todas as plataformas de computação pessoal.

Portabilidade:
    Aplicativos desenvolvidos em Python podem ser facilmente distribuídos para várias plataformas diferentes daquela em que foi desenvolvido, mesmo que estas não possuam o Python instalado.

Software Livre: 
    O Python é software livre, não impondo qualquer limitação à distribuição gratuita ou venda de programas.

Extensibilidade:
    O Python pode ser extendido através de módulos,escritos em Python ou rotinas escritas em outras linguagens, tais como C ou Fortran (Mais sobre isso no capítulo :ref:`capext`).

Orientação a objeto:
    Tudo em Python é um objeto: funções, variáveis de todos os tipos e até módulos (programas escritos em Python) são objetos.

Tipagem automática:
    O tipo de uma variável (string, inteiro, float, etc.) é determinado durante a execução do código; desta forma, você não necessita perder tempo definindo tipos de variáveis no seu programa.

Tipagem forte:
    Variáveis de um determinado tipo não podem ser tratadas como sendo de outro tipo. Assim, você não pode somar a string '123' com o inteiro 3. Isto reduz a chance de erros em seu programa. A variáveis podem, ainda assim, ser convertidas para outros tipos.

Código legível:
    O Python, por utilizar uma sintaxe simplificada e forçar a divisão de blocos de código por meio de indentação, torna-se bastante legível, mesmo para pessoas que não estejam familiarizadas com o programa.

Flexibilidade:
    O Python já conta com módulos para diversas aplicações, científicas ou não, incluindo módulos para interação com os protocolos mais comuns da Internet (FTP, HTTP, XMLRPC, etc.). A maior parte destes módulos já faz parte da distribuição básica do Python.

Operação com arquivos:
    A manipulação de arquivos, tais como a leitura e escrita de dados em arquivos texto e binário, é muito simplificada no Python, facilitando a tarefa de muitos pesquisadores ao acessar dados em diversos formatos.

Uso interativo:
    O Python pode ser utilizado interativamente, ou invocado para a execucão de scripts completos. O uso interativo permite "experimentar" comandos antes de incluí-los em programas mais complexos, ou usar o Python simplesmente como uma calculadora.

etc:
    ...


Entretanto, para melhor compreender todas estas vantagens apresentadas, nada melhor do que começar a explorar exemplos de computação científica na linguagem Python. Mas para inspirar o trabalho técnico, nada melhor do que um poema::

    >>> import this 
    The Zen of Python, by Tim Peters

    Beautiful is better than ugly. Explicit is better than implicit.
    Simple is better than complex. Complex is better than complicated.
    Flat is better than nested. Sparse is better than dense.
    Readability counts. Special cases aren't special enough to break
    the rules. Although practicality beats purity. Errors should never
    pass silently. Unless explicitly silenced. In the face of
    ambiguity, refuse the temptation to guess. There should be one- and
    preferably only one -obvious way to do it. Although that way may
    not be obvious at first unless you're Dutch. Now is better than
    never. Although never is often better than \*right\* now. If the
    implementation is hard to explain, it's a bad idea. If the
    implementation is easy to explain, it may be a good idea.
    Namespaces are one honking great idea - let's do more of those!


Usando este Livro
-----------------

Este livro foi planejado visando a versatilidade de uso. Sendo
assim, ele pode ser utilizado como livro didático (em cursos
formais) ou como referência pessoal para auto-aprendizagem ou
consulta.

Como livro didático, apresenta, pelo menos, dois níveis de
aplicação possíveis:


#.
   Um curso introdutório à linguagem Python, no qual se faria uso dos
   capítulos da primeira parte. O único pré-requisito seria uma
   exposição prévia dos alunos a conceitos básicos de programação (que
   poderia ser condensada em uma única aula).

#.
   Um curso combinado de Python e computação científica. O autor tem
   ministrado este tipo de curso com grande sucesso. Este curso faria
   uso da maior parte do conteúdo do livro, o instrutor pode
   selecionar capítulos de acordo com o interesse dos alunos.


Como referência pessoal, este livro atende a um público bastante
amplo, de leigos a cientistas. No início de cada capítulo
encontram-se os pré-requisitos para se entender o seu conteúdo. Mas
não se deixe inibir; as aplicações científicas são apresentadas
juntamente com uma breve introdução à teoria que as inspira.

Recomendo aos auto-didatas que explorem cada exemplo contido no
livro; eles ajudarão enormemente na compreensão dos tópicos
apresentados [7]_. Para os leitores sem sorte, que não dispõem de
um computador com o sistema operacional GNU/Linux instalado, sugiro
que o instalem, facilitará muito o acompanhamento dos exemplos.
Para os que ainda não estão prontos para abandonar o Windows,
instalem o Linux em uma máquina virtual [8]_! A distribuição que
recomendo para iniciantes é o Ubuntu (www.ubuntu.com).

Enfim, este livro foi concebido para ser uma leitura prazeirosa
para indivíduos curiosos como eu, que estão sempre interessados em
aprender coisas novas!

Bom Proveito! 

    Flávio Codeço Coelho
    Rio de Janeiro, 2010

.. [1]  www.python.org

.. [2]  Corporation for National Research Initiatives

.. [3]  GNU General Public License

.. [4]  www.jython.org

.. [5]  pypy.org

.. [6]  {www.codeplex.com/Wiki/View.aspx?ProjectName=IronPython}

.. [7] 
   O código fonte do exemplos está disponível na seguinte URL:
   http://fccoelho.googlepages.com/CCP_code.zip

.. [8] 
   Recomendo o VirtualBox (www.virtualbox.org), é software livre e
   fantástico!


