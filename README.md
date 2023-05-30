# [Pronta pra ser Cientista](https://sites.usp.br/prontacientista/), 4a. edição - 2023

## Aula 4, Ciência de Dados, 27 de maio de 2023 

### [Francesca B. L. Palmeira](https://fblpalmeira.github.io/), francesca@alumni.usp.br 

-----

## Motivação

O avanço tecnológico dos últimos anos facilitou o nosso acesso a equipamentos modernos de campo e a ferramentas gratuitas para a análise de dados de biodiversidade. Aliado a este fato, existe uma quantidade enorme de dados biológicos disponíveis em diferentes repositórios públicos e base de dados online.

É importante destacar que o trabalho com análise e visualização de dados de biodiversidade pode subsidiar o planejamento de ações de conservação baseadas em evidências.

O grande desafio para a pessoa aspirante a analista de dados da biodiversidade é conhecer a vastidão de opções de análises e modelos ecológicos disponíveis. Cada modelo tem as premissas que devem ser atendidas e um delineamento amostral específico de coleta de dados. Além dos conhecimentos teóricos de Biologia e Ecologia, o aspirante a analista de dados de biodiversidade precisa ter noções avançadas de Estatística e de Programação (ex. R, Python, entre outras linguagens) (Figura 1).

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1_Analise_Biodiversidade_%40fblpalmeira.png" align="center" width = "550px"/>

Figura 1.  Áreas do conhecimento necessárias para analisar dados de biodiversidade.

A [linguagem R](https://www.r-project.org/about.html) foi feita especificamente para oferecer um conjunto integrado de recursos para a manipulação de dados, análise estatística e visualização gráfica. Também possibilita a reprodutibilidade dos resultados garantindo a transparência das análises. Desta forma, o uso da linguagem R tem sido extremamente útil para analisar e visualizar toda essa quantidade de dados disponíveis, além de possibilitar uma maior transparência e reprodutibilidade no processo de análise. 

A comunidade R é muito amigável e as pessoas que fazem parte dessas comunidades são muito disponíveis para ajudar, tirar dúvidas, oferecer mentoria, entre outras colaborações. Existem várias comunidades, vale destacar as [RLadies Global](https://rladies.org/), uma organização sem fins lucrativos que atua em diversos países. No Brasil, temos vários capítulos das RLadies distribuídos por diferentes cidades. A nossa missão é promover o uso da linguagem R entre grupos subrepresentados para formarmos uma comunidade mais inclusiva e diversa. Oferecemos eventos gratuitos, presenciais e virtuais, para estudarmos a linguagem R, do nível básico ao avançado. Aqui em Ribeirão Preto, temos um [Capítulo](https://rladiesrp.github.io/) voltado para a área da biodiversidade e conservação. Confira os eventos que já realizamos lá na página do nosso [Meetup](https://www.meetup.com/rladies-ribeirao-preto). Os eventos podem ser assistidos no nosso canal do [YouTube](https://www.youtube.com/channel/UCmxRvwPXXLdcv_lWkIqB1yA/about).

-----
 
## Prática 

O objetivo desta aula prática é construir um gráfico que representa a riqueza e a abundância de espécies vegetais utilizando os dados coletados durante o nosso trabalho de campo na Floresta da USP em Ribeirão Preto, SP.

Durante o trabalho de campo, cada grupo de trabalho amostrou uma parcela de 30 x 30 metros no interior da Floresta, uma do lado esquerdo e a outra do lado direito, com uma distância de aproximadamente 30 metros entre as parcelas. A amostragem durou cerca de 30 minutos em cada parcela.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas.png" align="center" width = "800px"/>

Figura 2.  Localização das parcelas amostradas na Floresta da USP em Ribeirão Preto.

No laboratório, iremos simular os dados de amostragem de mais 10 parcelas na Floresta, totalizando seis parcelas no interior e seis na borda, incluindo as parcelas amostradas no campo. Os dados simulados serão utilizados para testar se existe diferença significativa entre a riqueza e a abundância de indivíduos na borda e no interior da floresta.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas_simuladas.png" align="center" width = "800px"/>

Figura 3. Transecto realizado na Floresta e localização das pareclas amostradas (em amarelo) e simuladas (em branco).

-----

## Código e Planilhas de dados

No link abaixo, está todo o material da aula incluindo o código dos exercícios, as planilhas .xlsx, os tutoriais em .pdf, etc.

- [Material para download](https://github.com/fblpalmeira/pronta_cientista/tree/main/data)

-----

## Links dos exercícios no Posit Cloud

Vamos fazer os exercícios utilizando a [linguagem R](https://www.r-project.org/about.html) em uma versão do [RStudio](https://posit.co/download/rstudio-desktop/) que está disponível na nuvem, sem precisar instalar de nenhum programa ou software no computador. Primeiro, você deverá criar uma conta pessoal no [Posit Cloud](https://posit.cloud/). O site é seguro e não precisa pagar nada, pois vamos optar pelo plano gratuito. O tutorial abaixo tem o passo a passo para abrir a conta. 

- [Tutorial para abrir uma conta no Posit Cloud `.pdf`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Tutotial_RStudio_Cloud_Abrir_Conta_Pronta_Cientista_2023_05_27.pdf)

A seguir, precisaremos acessar os exercícios clicando em qualquer um dos links abaixo. Dentro de cada link, tem o mesmo material. Como estamos utilizando o plano gratuito, apenas cinco pessoas podem acessar simultaneamente cada link. Caso algum link não funcione, pode ser que tenha mais de cinco pessoas tentando acessar ao mesmo tempo. Quando isso acontecer, tente acesso pelos outros links. Lembre-se que para fazer os exercícios que estão online, você vai precisar ter acesso à internet, abrir uma conta no [Posit Cloud](https://posit.cloud/) e fazer login com o seu email particular. 

- [Link1 `.R`](https://posit.cloud/content/5718175) 

- [Link2 `.R`](https://posit.cloud/content/6029576)

- [Link3 `.R`](https://posit.cloud/content/6029582)

- [Link4 `.R`](https://posit.cloud/content/6029592)

-----

## Preparando os dados

Carregar e manipular os dados no `R`:

``` r

###############
# Exercício 1 #
###############

# Construir um gráfico de Distribuição de Abundância de Espécies 
# das parcelas amostradas em campo (Parcela_1 e Parcela_2) 

# Instalar e abrir o pacote "readxl" que lê arquivos do Excel (extensões .xls ou .xlsx)
# Para ler outras extensões de arquivos (ex.: .txt, .csv, .pdf, .html) utilizamos 
# outros pacotes
install.packages("readxl") # Instalar 
library(readxl) # Abrir 

``` 

## Vizualizar a [Planilha da Parcela 1](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/planilha_de_campo_parcela_1_lado_esquerdo.jpeg)

``` r

# Criar um objeto para ler as planilhas de campo utilizando a função "read_excel"
# O nome do objeto (ex.: p1, p2, y) é editável e você pode mudar se necessário
# É importante que o nome do objeto seja curto e não tenha acento
p1 <- read_excel("parcela1_lado_esquerdo.xlsx", na = "-") # Ler a planilha da parcela 1
p1 # Vizualizar a planilha 1 parcialmente

# A tibble: 12 × 12
      ID Especie Familia Classificacao N_individuos Caracteristica Estado Local Latitude Longitude Parcela Observacao
   <dbl> <chr>   <chr>   <chr>                <dbl> <chr>          <chr>  <chr>    <dbl>     <dbl> <chr>   <chr>     
 1     1 sp1     Pipera… Herbácea                 8 Folha oval co… Com f… Inte…    -21.2     -47.9 Parcel… O desenho…
 2     2 sp2     NA      Arvoreta                 8 Folha longa e… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 3     3 sp3     NA      Árvore                   4 Árvore cumpri… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 4     4 sp4     NA      Árvore                   2 Folha pequena  Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 5     5 sp5     NA      Trepadeira               2 Folha enrolad… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 6     6 sp6     NA      Herbácea                 5 Sai do mesmo … Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 7     7 sp7     Croton  Árvore                   5 Folha prateada Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 8     8 sp8     NA      Árvore                   4 Folha com for… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
 9     9 sp9     NA      Herbácea                24 Folha pequena… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
10    10 sp10    NA      Rastejante               1 Folha com for… Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
11    11 sp11    NA      Plântula                 5 Folha grande … Veget… Inte…    -21.2     -47.9 Parcel… O desenho…
12    12 sp12    NA      Plântula                 4 Planta espada  Veget… Inte…    -21.2     -47.9 Parcel… O desenho…

``` 

## Vizualizar a [Planilha da Parcela 2](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/planilha_de_campo_parcela_2_lado_direito.jpeg)

``` r

p2 <- read_excel("parcela2_lado_direito.xlsx", na = "-") # Ler a planilha da parcela 2
p2 # Vizualizar a planilha 2 parcialmente

# A tibble: 11 × 12
      ID Especie Familia Classificacao N_individuos Caracteristica Estado     Local   Latitude
   <dbl> <chr>   <chr>   <chr>                <dbl> <chr>          <chr>      <chr>      <dbl>
 1     1 sp1     NA      Herbácea                 8 Folha          Vegetativo Interi…    -21.2
 2     2 sp2     NA      Árvore                   1 Folha áspera   Vegetativo Interi…    -21.2
 3     3 sp3     NA      Herbácea                 3 Folha          Vegetativo Interi…    -21.2
 4     4 sp4     NA      Herbácea                 7 Folha          Flores     Interi…    -21.2
 5     5 sp5     NA      Herbácea                 1 Folha          Vegetativo Interi…    -21.2
 6     6 sp6     NA      Árvore                   1 Folha          Vegetativo Interi…    -21.2
 7     7 sp7     NA      Árvore                   2 Folha longa    Vegetativo Interi…    -21.2
 8     8 sp8     NA      Herbácea                12 Folha          Vegetativo Interi…    -21.2
 9     9 sp9     NA      Herbácea                 2 Folha          Vegetativo Interi…    -21.2
10    10 sp10    NA      Herbácea                 1 Folha          Vegetativo Interi…    -21.2
11    11 sp11    NA      Herbácea                 1 Folha          Vegetativo Interi…    -21.2
# ℹ 3 more variables: Longitude <dbl>, Parcela <chr>, Observacao <chr>

``` 

# Juntar as duas planilhas em um único objeto 

A união das duas planilhas (p1 e p2) utilizando a função "rbind" resultará no objeto (y) a seguir:

``` r

# Juntar as duas planilhas (p1 e p2) em um único objeto (y) utilizando a função "rbind"
y <- rbind (p1, p2)
y # Vizualizar a planilha parcialmente

# A tibble: 23 × 12
      ID Especie Familia   Classifica…¹ N_ind…² Carac…³ Estado Local Latit…⁴ Longi…⁵ Parcela Obser…⁶
   <dbl> <chr>   <chr>     <chr>          <dbl> <chr>   <chr>  <chr>   <dbl>   <dbl> <chr>   <chr>  
 1     1 sp1     Piperacea Herbácea           8 Folha … Com f… Inte…   -21.2   -47.9 Parcel… O dese…
 2     2 sp2     NA        Arvoreta           8 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 3     3 sp3     NA        Árvore             4 Árvore… Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 4     4 sp4     NA        Árvore             2 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 5     5 sp5     NA        Trepadeira         2 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 6     6 sp6     NA        Herbácea           5 Sai do… Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 7     7 sp7     Croton    Árvore             5 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 8     8 sp8     NA        Árvore             4 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
 9     9 sp9     NA        Herbácea          24 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
10    10 sp10    NA        Rastejante         1 Folha … Veget… Inte…   -21.2   -47.9 Parcel… O dese…
# … with 13 more rows, and abbreviated variable names ¹​Classificacao, ²​N_individuos,
#   ³​Caracteristica, ⁴​Latitude, ⁵​Longitude, ⁶​Observacao
# ℹ Use `print(n = ...)` to see more rows

```

## Vizualizando a planilha inteira

Utilize o comando 'View' para visualizar a planilha inteira. Cada linha representa uma observação e cada coluna representa uma variável.

``` r

View(y) # Vizualizar a planilha inteira

``` 

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Planilha_parcelas_1_e_2.png"/>

Agora que já temos uma única planilha com os dados coletados, iremos salvá-la em um arquivo que, posteriormente, poderá ser lido no Excel.
É importante salvar todas as planilhas de entrada de dados e todas as figuras geradas durante as análises. 

``` r

# Abrir o pacote "openxlsx" que salva arquivos na extensão do Excel (extensões .xls ou .xlsx)
install.packages("openxlsx") # Instalar o pacote
library(openxlsx) # Abrir o pacote

# Salvar um arquivo com as duas planilhas unidas
# Entre "aspas" está o nome do arquivo que será salvo, você pode editar se precisar
# Lembrando que o nome do arquivo não pode ter vírgula e deve ser curto 
write.xlsx(y, "parcelas_1_e_2_juntas.xlsx") # Salvar o arquivo utilizando a função "write.xlsx" 

```

## Vamos começar a explorar os dados coletados? 

Utilizando as funções abaixo poderemos visualizar a estrutura interna dos dados (variável numérica, categórica, etc.), ver as médias e medianas de cada variável, os valores máximo e mínimo, entre outras informações.

----

# Verificando a estrutura interna de cada variável 

``` r

# Explorando os dados 
# Os comandos a seguir servem para conhecermos a estrutura dos dados e verificar 
# quais deles são numéricos, quais são categóricos e os valores mínimo e máximo de
# cada variável
str(y)     # Exibe a estrutura interna de cada variável dentro do objeto 

tibble [23 × 12] (S3: tbl_df/tbl/data.frame)
 $ ID            : num [1:23] 1 2 3 4 5 6 7 8 9 10 ...
 $ Especie       : chr [1:23] "sp1" "sp2" "sp3" "sp4" ...
 $ Familia       : chr [1:23] "Piperacea" "NA" "NA" "NA" ...
 $ Classificacao : chr [1:23] "Herbácea" "Arvoreta" "Árvore" "Árvore" ...
 $ N_individuos  : num [1:23] 8 8 4 2 2 5 5 4 24 1 ...
 $ Caracteristica: chr [1:23] "Folha oval com bico" "Folha longa e áspera" "Árvore cumprida" "Folha pequena" ...
 $ Estado        : chr [1:23] "Com frutos" "Vegetativo" "Vegetativo" "Vegetativo" ...
 $ Local         : chr [1:23] "Interior" "Interior" "Interior" "Interior" ...
 $ Latitude      : num [1:23] -21.2 -21.2 -21.2 -21.2 -21.2 ...
 $ Longitude     : num [1:23] -47.9 -47.9 -47.9 -47.9 -47.9 ...
 $ Parcela       : chr [1:23] "Parcela_1" "Parcela_1" "Parcela_1" "Parcela_1" ...
 $ Observacao    : chr [1:23] "O desenho da folha consta na planilha original" "O desenho da folha consta na planilha original" "O desenho da folha consta na planilha original" "O desenho da folha consta na planilha original" ...

``` 

# Ver as amplitudes mínima e máxima, a média e a mediana de cada variável

``` r

summary(y) # Exibe o resumo de cada variável mostrando as amplitudes mínima e máxima, a média e a mediana

       ID           Especie            Familia          Classificacao       N_individuos    Caracteristica        Estado             Local          
 Min.   : 1.000   Length:23          Length:23          Length:23          Min.   : 1.000   Length:23          Length:23          Length:23         
 1st Qu.: 3.500   Class :character   Class :character   Class :character   1st Qu.: 1.500   Class :character   Class :character   Class :character  
 Median : 6.000   Mode  :character   Mode  :character   Mode  :character   Median : 4.000   Mode  :character   Mode  :character   Mode  :character  
 Mean   : 6.261                                                            Mean   : 4.826                                                           
 3rd Qu.: 9.000                                                            3rd Qu.: 6.000                                                           
 Max.   :12.000                                                            Max.   :24.000                                                           
    Latitude        Longitude        Parcela           Observacao       
 Min.   :-21.16   Min.   :-47.86   Length:23          Length:23         
 1st Qu.:-21.16   1st Qu.:-47.86   Class :character   Class :character  
 Median :-21.16   Median :-47.86   Mode  :character   Mode  :character  
 Mean   :-21.16   Mean   :-47.86                                        
 3rd Qu.:-21.16   3rd Qu.:-47.86                                        
 Max.   :-21.16   Max.   :-47.86                                        

```

Agora, vamos precisar manipular alguns dados da planilha para fazer o gráfico. Primeiro, iremos filtrar a coluna "Especies" e "N_individuos" e depois iremos contar quantos indivíduos por espécie registramos nas duas parcelas amostradas.

``` r

# Abrir os pacotes "dplyr" e "forcats" para manipular a planilha
install.packages("dplyr") # Instalar 
install.packages("forcats") 
library(dplyr) # Abrir 
library(forcats) 

# Agrupar as Espécies (sp1, sp2, etc.) e contar o Número de indivíduos
y1 <- y %>% group_by(Especie) %>% # Agrupar
            summarize(N_individuos = sum(N_individuos)) # Contar
y1

``` 

## Após a filtragem dos dados teremos o objeto (y1) a seguir:

``` r

# A tibble: 12 × 2
   Especie N_individuos
   <chr>          <dbl>
 1 sp1               16
 2 sp10               2
 3 sp11               6
 4 sp12               4
 5 sp2                9
 6 sp3                7
 7 sp4                9
 8 sp5                3
 9 sp6                6
10 sp7                7
11 sp8               16
12 sp9               26

```

## Gráfico de barras mostrando a Distribuição de Abundância de Espécies 

Após contar o número de espécies por indivíduos, iremos visualizar esses dados em um simples gráfico de barras. Aproveite para verificar quais espécies foram mais abundante e quais foram raras. 

``` r

# Construir um gráfico de barras para visualizar o número de indivíduos por espécie registrada
ggplot(y1, aes(Especie, N_individuos))+ 
  geom_col()

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1a_DAE.png"/>

## Organizando o gráfico em ordem crescente

Finalmente, temos um gráfico! Agora vamos deixá-lo mais intuitivo e utilizar a função "reorder" para ordenar as espécies conforme o número de indivíduos registrados.

``` r

# Ordenar o número de indivíduos por espécie em ordem crescente 
# utilizando a função "reorder"  
ggplot(y1, aes(reorder(Especie, N_individuos), N_individuos))+ 
  geom_col()
  
```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1b_DAE.png"/>

## Organizando o gráfico em ordem decrescente

``` r

# Ordenar o número de indivíduos por espécie em ordem decrescente para
# visualizarmos a Distribuição de Abundância das Espécies (DAE), desta forma,
# poderemos identificar facilmente quais são as espécies mais abundantes e quais são as mais raras
# Para ordenar em ordem descrescente basca colocar um sinal de menos (-) na variável
# "-N_individuos" depois da função "reorder"
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col()

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1c_DAE.png"/>

## Colorindo o gráfico

``` r

# Colorir as barras do gráfico editando o argumento "fill" dentro da função "geom_col" 
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen") # Editar a cor do gráfico

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1d_DAE.png"/>

## Renomeando as etiquetas dos eixos x e y 

``` r

# Renomear as etiquetas dos eixos (x, y) do gráfico utilizando a função "labs"
# Colocar acentos e descrever sucintamente para que o leitor possa saber o que significa cada eixo
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen")+
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)") # Editar a etiqueta

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1e_DAE.png"/>

## Limpando o plano de fundo

``` r

# Limpar o fundo do gráfico utilizando a função 'theme_bw'
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw() # Limpar o fundo do gráfico
         
```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1f_DAE.png"/>

## Limpando a grade de linhas

``` r

# Limpar a grade do gráfico utilizando o "element_blank()" dentro da função 'theme'
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw()+
  theme (panel.grid.major.x = element_blank(), # Limpar linhas do eixo x
         panel.grid.minor.x = element_blank())+
  theme (panel.grid.major.y = element_blank(), # Limpar linhas do eixo y
         panel.grid.minor.y = element_blank())

``` 
<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1g_DAE.png"/>

## Aumentando o tamanho das letras 

``` r

# Aumentar o tamanho da letra da etiqueta em cada eixo (x e y) editando os 
# argumentos (axis.title.x=element_text(size=20) e (axis.title.y=element_text(size=20)) 
# da função 'theme'. Caso necessário utilize uma letra maior ou menor que 20
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen")+
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw()+
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank())+
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank())+
  theme (axis.title.x=element_text(size=20))+ # Aumentar as letras no eixo x
  theme (axis.title.y=element_text(size=20)) # Aumentar as letras no eixo y

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1h_DAE.png"/>

## Aumentando o tamanho dos números 

``` r

# Aumentar o tamanho dos números nos eixos x e y editando os 
# argumentos (axis.text.x=element_text(size=16) e (axis.text.y=element_text(size=16) da função 'theme' 
# Caso necessário utilize um tamanho maior ou menor que 16
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen")+
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw()+
  theme (panel.grid.major.x = element_blank(),
         panel.grid.minor.x = element_blank())+
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank())+
  theme (axis.title.x=element_text(size=20))+ 
  theme (axis.title.y=element_text(size=20))+
  theme (axis.text.x=element_text(size=16))+ # Aumentar o tamanho dos números no eixo x
  theme (axis.text.y=element_text(size=16)) # Aumentar o tamanho dos números no eixo y

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1i_DAE.png"/>

## Salvando a figura final em um arquivo .png

```

# Salvar a figura final em formato .png
# Para salvar o gráfico é necessário utilizar a função 'png' antes da função 'ggplot' 
# e a dev.off() na última linha
png(file="Figura1i_DAE.png", width = 1000, height = 600) # Salvar a figura
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos))+
  geom_col(fill = "darkgreen")+
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw()+
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank())+ 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank())+
  theme (axis.title.x=element_text(size=20))+ 
  theme (axis.title.y=element_text(size=20))+
  theme (axis.text.x=element_text(size=16))+ 
  theme (axis.text.y=element_text(size=16))
dev.off() # Salvar a figura

``` 

-----

## Construir uma curva de rarefação das espécies amostradas nas duas parcelas

``` r

###############
# Exercício 2 #
###############

# Fazer uma curva de rarefação utilizando a riqueza de espécies 
# e o número de indivíduos contados

# Abrir pacote para remodelar a tabela de dados
library(reshape2)
y2 <- dcast(y, Especie ~ Parcela, value.var="N_individuos")
y2

# Substituir os NA's por zeros
y2 <- y2 %>% replace(is.na(.), 0) 
str(y2)

# Transformar o data.frame y2 em "integer"
y3 <- as.matrix(apply(y2[,-1],2,as.integer))
str(y3)

# Informar que os nomes da espécies 
row.names(y3) <- y2[,1]

# Contar o número de indivíduos por parcela
colSums(y3)

#Abrir pacote para fazer a interpolação e extrapolação dos dados
# Comparar as duas parcelas de amostragem (Parcela_1 e Parcela_2)
library(iNEXT)
estimates <- iNEXT(y3, datatype="abundance", endpoint=100)

# A comparação da riqueza de espécies entre as comunidades deve ser feita com base na riqueza 
# de espécies rarefeita, que é calculada com base no número de indivíduos da parcela 
# de amostragem com menor abundância (Da Silva et al. 2022 - Análises ecológicas no R)
ggiNEXT(estimates) +
  scale_linetype_discrete(labels = c("Interpolado", "Extrapolado")) +  
  scale_colour_manual(values = c("orange", "cyan")) +
  labs(x = "Número de indivíduos", y = " Riqueza de espécies")+
  theme_bw() +
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank()) +
  theme (axis.text.x=element_text(size=12)) +
  theme (axis.text.y=element_text(size=12))

# Inserir uma linha vertical tracedaja na Parcela_2 e salvar a figura final  
png(file="Figura2_Rarefacao_Parcelas_1_e_2.png", width = 1000, height = 600)
ggiNEXT(estimates) +
  geom_vline(xintercept = 10, lty = 2) +
  scale_linetype_discrete(labels = c("Interpolado", "Extrapolado")) +  
  scale_colour_manual(values = c("orange", "cyan")) +
  labs(x = "Número de indivíduos", y = " Riqueza de espécies")+
  theme_bw() +
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank()) +
  theme (axis.text.x=element_text(size=12)) +
  theme (axis.text.y=element_text(size=12))
dev.off()

``` 

## Comparando as duas parcelas amostradas 

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura2_Rarefacao_Parcelas_1_e_2.png" align="center" width = "800px"/>

----

## Interpretação dos resultados

Existiu diferença estatística entre a riqueza e o número de espécies nas parcelas amostradas?

----

## Construir uma curva de rarefação das espécies amostradas na borda e no interior

``` r

###############
# Exercício 3 #
###############

# Utilizar dados simulados para para testar se existe diferença significativa
# entre a riqueza e a abundância de indivíduos na borda e no interior da floresta

# Ler as planilhas das parcelas amostradas e das parcelas simuladas
y4 <- read_excel("parcelas_1_e_2_juntas.xlsx", na = "-") # parcelas amostrada
y5 <- read_excel("parcelas_simulacao3.xlsx", na = "-") # parcelas simuladas

# Juntar as duas planilhas 
y6 <- rbind(y4, y5)

# Salvar um arquivo com as duas planilhas unidas
write.xlsx(y6, 'parcelas_1_e_2_juntas_e_simuladas.xlsx')

# Remodelar a tabela de dados
y7 <- dcast(y6, Especie ~ Local, value.var="N_individuos")
y7

# Transformar o data.frame y2 em "integer"
y8 <- as.matrix(apply(y7[,-1],2,as.integer))
str(y8)

# Informar que os nomes da espécies 
row.names(y8) <- y7[,1]

# Contar o número de indivíduos por parcela
colSums(y8)

# Comparar as parcelas da Borda e do Interior
estimates2 <- iNEXT(y8, datatype="abundance", endpoint=100)

# Salvar a figura 
png(file="Figura3_Rarefacao_Simulada_Borda_e_Interior.png", width = 1000, height = 600)
ggiNEXT(estimates2) + 
geom_vline(xintercept = 10, lty = 2) +
  scale_linetype_discrete(labels = c("Interpolado", "Extrapolado")) + 
  scale_colour_manual(values = c("orange", "cyan")) +
  labs(x = "Número de indivíduos", y = " Riqueza de espécies")+
  theme_bw() +
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank()) +
  theme (axis.text.x=element_text(size=12)) +
  theme (axis.text.y=element_text(size=12))
dev.off()

```

##  Comparando a borda e o interior da Floresta

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura3_Rarefacao_Simulada_Borda_e_Interior.png" align="center" width = "800px"/>

-----

## Interpretação dos resultados

Existiu diferença estatística entre a riqueza e o número de espécies na borda e no interior da Floresta?

-----

## Vamos exercitar um pouco de programação fazendo um gráfico de waffle? 

O gráfico de waffle é utilizado para representar proporções. Neste exercício, você poderá editar os argumentos da função e fazer um gráfico que conta a história da sua vida. Veja o exemplo abaixo e inspire-se. 

O código do exercício está em um dos quatro links disponibilizados no início desta página. Caso tenha alguma dúvida sobre o exercício é só seguir o tutorial abaixo. No tutorial, tem todo o passo a passo de como construir o gráfico da sua biografia e, ao final, exportá-lo para o computador.

- [Tutorial para fazer um gráfico de waffle `.pdf`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Tutotial_RStudio_Cloud_Waffle_Pronta_Cientista_2023_05_27.pdf)


## A vida da cientista em um gráfico de waffle

Edite o código abaixo utilizando os dados da sua biografia.

``` r

# Faça o seu gráfico aqui - Modelo 1
png(file="Figura2_waffle.png", width = 1000, height = 600)
parts <- c('Maternal'=1, 'Jardim'=3, 'Ensino Fundamental' = 4, 'Ensino Médio' = 5)
waffle(parts, rows=3, title = "A minha vida em um gráfico de waffle", 
       xlab = "1 quadrado = 12 meses")+
       theme (legend.text =element_text (size = 15), axis.title.x=element_text(size = 20))+
       labs(caption = "@Seu nome")
dev.off()

``` 

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1_waffle.png" align="center" width = "800px"/>

-----

## Bibliografia básica

- [Capítulo 2 - Voltando ao básico: como dominar a arte de fazer perguntas cientificamente relevantes `.html`](https://analises-ecologicas.netlify.app/cap2.html)

- [Capítulo 10 - Rarefação: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap10.html)

- [Capítulo 11 - Estimadores de riqueza: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap11.html)
 
-----

## Bibliografia complementar

- [Livro completo - Análises Ecológicas no R `.html`](https://analises-ecologicas.com/index.html)
