# Pronta pra ser Cientista 2023, 4a. edição

## Aula 4, Ciência de Dados, 27 de maio de 2023 

### Francesca B. L. Palmeira, francesca@alumni.usp.br 

-----

O avanço tecnológico dos últimos anos facilitou o nosso acesso a equipamentos modernos de campo e a ferramentas gratuitas para a análise de dados de biodiversidade. Aliado a este fato, existe uma quantidade enorme de dados biológicos disponíveis em diferentes repositórios públicos e base de dados online. 

O grande desafio para a pessoa aspirante a analista de dados da biodiversidade é conhecer toda esta vastidão de opções de análises e modelos ecológicos disponíveis. Cada modelo tem premissas que devem ser atendidas e um delineamento amostral específico para a coleta de dados. Além dos conhecimentos teóricos de Biologia e Ecologia, o aspirante a analista de dados de biodiversidade precisa ter noções avançadas de Estatística e de Programação (ex. R, Python, entre outras linguagens) (Figura 1).

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/fig1_pronta.png" align="center" width = "550px"/>

Figura 1.  Áreas do conhecimento necessárias para analisar dados de biodiversidade.

Neste caso, a linguagem R foi feita especificamente para oferecer um conjunto integrado de recursos para a manipulação de dados, análise estatística e visualização gráfica (https://www.r-project.org/about.html) Também possibilita a reprodutibilidade dos resultados garantindo a transparência das análises. Desta forma, o uso da linguagem R tem sido extremamente útil para analisar e visualizar toda essa quantidade de dados disponíveis, além de possibilitar uma maior transparência e reprodutibilidade no processo de análise. 

Também é importante realçar que o trabalho com análise e visualização de dados de biodiversidade pode subsidiar o planejamento de ações de conservação baseadas em evidências.

-----
 
EXERCÍCIO: O objetivo desta aula prática é construir um gráfico que representa a riqueza e a abundância de espécies vegetais utilizando os dados coletados durante o nosso trabalho de campo na Floresta da USP, município de Ribeirão Preto, SP.

Durante o trabalho de campo, formamos duas equipes e cada uma amostrou uma parcela no interior da Floresta, uma do lado esquerda e a outra do lado direito, com uma distância entra elas de aproximadamente 30 metros. A amostragem durou cerca de 30 minutos em cada parcela.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas.png" align="center" width = "800px"/>

Figura 2.  Localização das pareclas amostradas na área de estudo.

-----

MATERIAIS:

- [Tutorial para abrir uma conta no RStudio Cloud `.pdf`]()

- [Código `.R`]()

- [Planilha `.csv`]()

- [Planilha `.csv`]()

- [Planilha `.csv`]()

- [Link1 `.R`](https://posit.cloud/content/5718175)

- [Link2 `.R`]()

- [Link3 `.R`]()

- [Link4 `.R`]()

- [Link5 `.R`]()

-----

## Prática

Esta prática tem três etapas principais: 

- Preparando os dados (Carregar, manipular e limpar o arquivo de dados);

- Análise de dados; e,
 
- Visualização de resultados.  

-----

## Preparando os dados

Carregar, manipular e limpar o arquivo de dados no `R`:

``` r
#######################
# Preparando os dados #
#######################

Sys.setlocale("LC_ALL","pt_BR.UTF-8")

library (readxl) # Abrir o pacote que lê arquivos do Excel (extensões .xls ou .xlsx)
library(dplyr) # Abrir o pacote para manipular os dados 

y1 <- read_excel("parcela_lado_esquerdo.xlsx", na = "-") # Criar um objeto (ex.: y1) que armazena a planilha do Excel
y1 <- y1 %>% mutate (Lado = "Esquerdo", .after=ID) # Criar uma nova coluna chamada "Lado" e posicioná-la depois da coluna ID
y1 <- y1 %>% mutate (Parcela = "P1", .after=ID) # Criar uma nova coluna chamada "Parcela" e posicioná-la depois da coluna ID 

y2 <- read_excel("parcela_lado_direito.xlsx", na = "-")
y2 <- y2 %>% mutate (Lado = "Direito", .after=ID)
y2 <- y2 %>% mutate (Parcela = "P2", .after=ID)

y3 <- rbind(y1, y2)
```





-----

Roteiro para elaborar um Projeto de Pesquisa

COMO FAZER UMA PESQUISA?

ROTEIRO PARA ELABORAR UM PROJETO DE PESQUISA:

- Introdução/Justificativa: Fazer uma boa pergunta e contextualizar com embasamento teórico;
- Métodos: Adotar um método robusto (desenho amostral ou delineamento amostral);
- Resultados: Análise e visualização dos dados, interpretação e comunicação dos resultados;
- Discussão/Conclusão: Achados, aplicações e novas perguntas que deverão ser respondidas;

BIBLIOGRAFIA BÁSICA:

- [Capítulo 11 - Estimadores de riqueza: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap11.html)

BIBLIOGRAFIA COMPLEMENTAR:

- [Livro completo: Análises Ecológicas no R `.html`](https://analises-ecologicas.com/index.html)
