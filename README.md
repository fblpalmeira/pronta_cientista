# Pronta pra ser Cientista 2023, 4a. edição

## Aula 4, Ciência de Dados, 27 de maio de 2023 

### Francesca B. L. Palmeira, francesca@alumni.usp.br 

-----

## Motivação

O avanço tecnológico dos últimos anos facilitou o nosso acesso a equipamentos modernos de campo e a ferramentas gratuitas para a análise de dados de biodiversidade. Aliado a este fato, existe uma quantidade enorme de dados biológicos disponíveis em diferentes repositórios públicos e base de dados online.

É importante destacar que o trabalho com análise e visualização de dados de biodiversidade pode subsidiar o planejamento de ações de conservação baseadas em evidências.

O grande desafio para a pessoa aspirante a analista de dados da biodiversidade é conhecer toda esta vastidão de opções de análises e modelos ecológicos disponíveis. Cada modelo tem premissas que devem ser atendidas e um delineamento amostral específico para a coleta de dados. Além dos conhecimentos teóricos de Biologia e Ecologia, o aspirante a analista de dados de biodiversidade precisa ter noções avançadas de Estatística e de Programação (ex. R, Python, entre outras linguagens) (Figura 1).

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/fig1_pronta.png" align="center" width = "550px"/>

Figura 1.  Áreas do conhecimento necessárias para analisar dados de biodiversidade.

A linguagem [R](https://www.r-project.org/about.html) foi feita especificamente para oferecer um conjunto integrado de recursos para a manipulação de dados, análise estatística e visualização gráfica. Também possibilita a reprodutibilidade dos resultados garantindo a transparência das análises. Desta forma, o uso da linguagem R tem sido extremamente útil para analisar e visualizar toda essa quantidade de dados disponíveis, além de possibilitar uma maior transparência e reprodutibilidade no processo de análise. 

A comunidade R é muito amigável e as pessoas que fazem parte dessas comunidade são muito disponíveis para ajudar, tirar dúvidas, oferecer mentoria, entre outras colaborações. Existe várias comunidades, vale destacar as [RLadies Global](https://rladies.org/), uma organização sem fins lucrativos que atua em diversos países. No Brasil, temos vários capítulos das RLadies distribuídos por diferentes cidades. A nossa missão é promover o uso da linguagem R entre grupos subrepresentados para formarmos uma comunidade mais inclusiva e diversa. Oferecemos eventos gratuitos, presenciais e virtuais, para estudarmos a linguagem R, do nível básico ao avançado. Aqui em Ribeirão Preto, temos um [Capítulo](https://rladiesrp.github.io/) voltado para a área da biodiversidade e conservação. Confira os eventos que já realizamos lá na página do nosso [Meetup](https://www.meetup.com/rladies-ribeirao-preto). Oseventos podem ser assistidos no nosso canal do [YouTube](https://www.youtube.com/channel/UCmxRvwPXXLdcv_lWkIqB1yA/about).

-----
 
## Prática 

O objetivo desta aula prática é construir um gráfico que representa a riqueza e a abundância de espécies vegetais utilizando os dados coletados durante o nosso trabalho de campo na Floresta da USP em Ribeirão Preto, SP.

Durante o trabalho de campo, formamos duas equipes e cada uma amostrou uma parcela no interior da Floresta, uma do lado esquerda e a outra do lado direito, com uma distância entre elas de aproximadamente 30 metros. A amostragem durou cerca de 30 minutos em cada parcela.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas.png" align="center" width = "800px"/>

Figura 2.  Localização das parcelas amostradas na Floresta da USP em Ribeirão Preto.

No laboratório, iremos simular os dados de amostragem de mais 10 parcelas na Floresta, totalizando no seis parcelas interior e seis na borda na borda, incluindo as duas parcelas que amostramos no campo. O objetivo da simulação será aumentar o esforço amostral para que possamos fazer os exercícios e interpretar os resultados.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas_simuladas.png" align="center" width = "800px"/>

Figura 3.  Localização das pareclas amostradas e das parcelas hipoteticamente simuladas.

-----

## Código e Planilhas de dados

- [Código `.R`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/riqueza_pronta.R)

- [Planilha - Parcela_1 `.csv`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/parcela1_lado_esquerdo.xlsx)

- [Planilha - Parcela_2 `.csv`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/parcela2_lado_direito.xlsx)

- [Planilha - Simulação `.csv`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/parcelas_simulacao3.xlsx)

-----

## Links dos exercícios no Posit Cloud

- [Tutorial para abrir uma conta no Posit Cloud `.pdf`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Tutotial_RStudio_Cloud_Abrir_Conta_Pronta_Cientista_2023_05_27.pdf)

- [Link1 `.R`](https://posit.cloud/content/5718175)

- [Link2 `.R`](https://posit.cloud/content/6029576)

- [Link3 `.R`](https://posit.cloud/content/6029582)

- [Link4 `.R`]()

- [Link5 `.R`]()

-----

## Preparando os dados

Carregar e manipular os dados no `R`:

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

## Bibliografia básica

- [Capítulo 10 - Rarefação: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap10.html)

- [Capítulo 11 - Estimadores de riqueza: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap11.html)
 
-----

## Bibliografia complementar

- [Livro completo - Análises Ecológicas no R `.html`](https://analises-ecologicas.com/index.html)
