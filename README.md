# [Pronta pra ser Cientista](https://sites.usp.br/prontacientista/), 4a. edição - 2023

## Aula 4, Ciência de Dados, 27 de maio de 2023 

### [Francesca B. L. Palmeira](https://fblpalmeira.github.io/), francesca@alumni.usp.br 

-----

## Motivação

O avanço tecnológico dos últimos anos facilitou o nosso acesso a equipamentos modernos de campo e a ferramentas gratuitas para a análise de dados de biodiversidade. Aliado a este fato, existe uma quantidade enorme de dados biológicos disponíveis em diferentes repositórios públicos e base de dados online.

É importante destacar que o trabalho com análise e visualização de dados de biodiversidade pode subsidiar o planejamento de ações de conservação baseadas em evidências.

O grande desafio para a pessoa aspirante a analista de dados da biodiversidade é conhecer toda esta vastidão de opções de análises e modelos ecológicos disponíveis. Cada modelo tem as premissas que devem ser atendidas e um delineamento amostral específico de coleta de dados. Além dos conhecimentos teóricos de Biologia e Ecologia, o aspirante a analista de dados de biodiversidade precisa ter noções avançadas de Estatística e de Programação (ex. R, Python, entre outras linguagens) (Figura 1).

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1_Analise_Biodiversidade_%40fblpalmeira.png" align="center" width = "550px"/>

Figura 1.  Áreas do conhecimento necessárias para analisar dados de biodiversidade.

A linguagem [R](https://www.r-project.org/about.html) foi feita especificamente para oferecer um conjunto integrado de recursos para a manipulação de dados, análise estatística e visualização gráfica. Também possibilita a reprodutibilidade dos resultados garantindo a transparência das análises. Desta forma, o uso da linguagem R tem sido extremamente útil para analisar e visualizar toda essa quantidade de dados disponíveis, além de possibilitar uma maior transparência e reprodutibilidade no processo de análise. 

A comunidade R é muito amigável e as pessoas que fazem parte dessas comunidade são muito disponíveis para ajudar, tirar dúvidas, oferecer mentoria, entre outras colaborações. Existe várias comunidades, vale destacar as [RLadies Global](https://rladies.org/), uma organização sem fins lucrativos que atua em diversos países. No Brasil, temos vários capítulos das RLadies distribuídos por diferentes cidades. A nossa missão é promover o uso da linguagem R entre grupos subrepresentados para formarmos uma comunidade mais inclusiva e diversa. Oferecemos eventos gratuitos, presenciais e virtuais, para estudarmos a linguagem R, do nível básico ao avançado. Aqui em Ribeirão Preto, temos um [Capítulo](https://rladiesrp.github.io/) voltado para a área da biodiversidade e conservação. Confira os eventos que já realizamos lá na página do nosso [Meetup](https://www.meetup.com/rladies-ribeirao-preto). Os eventos podem ser assistidos no nosso canal do [YouTube](https://www.youtube.com/channel/UCmxRvwPXXLdcv_lWkIqB1yA/about).

-----
 
## Prática 

O objetivo desta aula prática é construir um gráfico que representa a riqueza e a abundância de espécies vegetais utilizando os dados coletados durante o nosso trabalho de campo na Floresta da USP em Ribeirão Preto, SP.

Durante o trabalho de campo, formamos duas equipes e cada uma amostrou uma parcela de 30 x 30 metros no interior da Floresta, uma do lado esquerdo e a outra do lado direito, com uma distância entre elas de aproximadamente 30 metros. A amostragem durou cerca de 30 minutos em cada parcela.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas.png" align="center" width = "800px"/>

Figura 2.  Localização das parcelas amostradas na Floresta da USP em Ribeirão Preto.

No laboratório, iremos simular os dados de amostragem de mais 10 parcelas na Floresta, totalizando seis parcelas no interior e seis na borda, incluindo as as parcelas amostradas no campo. O objetivo da simulação será aumentar o esforço amostral para que possamos fazer os exercícios e interpretar os resultados.

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/area_de_estudo_parcelas_simuladas.png" align="center" width = "800px"/>

Figura 3. Transecto realizado na Floresta e localização das pareclas amostradas e simuladas.

-----

## Código e Planilhas de dados

No link abaixo, está todo o material do curso incluindo o código dos exercícios, as planilhas .xlsx, os tutoriais em .pdf, etc.

- [Material para download](https://github.com/fblpalmeira/pronta_cientista/tree/main/data)

-----

## Links dos exercícios no [Posit Cloud](https://posit.cloud/)

- [Tutorial para abrir uma conta no Posit Cloud `.pdf`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Tutotial_RStudio_Cloud_Abrir_Conta_Pronta_Cientista_2023_05_27.pdf)

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

# Criar um objeto para ler as planilhas de campo utilizando a função "read_excel"
# O nome do objeto (ex.: p1, p2, y) é editável e você pode mudar se necessário
# É importante que o nome do objeto seja curto e não tenha acento
p1 <- read_excel("parcela1_lado_esquerdo.xlsx", na = "-") # Planilha da parcela 1
p2 <- read_excel("parcela2_lado_direito.xlsx", na = "-") # Planilha da parcela 2

# Juntar as duas planilhas (p1 e p2) em um único objeto (y) utilizando a função "rbind"
y <- rbind (p1, p2)
y # Vizualizar a planilha parcialmente
View(y) # Vizualizar a planilha inteira

```

## A união das duas planilhas (p1 e p2) resultará na tabela de dados (y) a seguir:

``` r

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

Utilizando as funções abaixo podemos explorar os dados, visualizar a planilha, conhecer a estrutura interna de cada variável, ver as médias e medianas de cada varíavel numérica, os valores máximo e mínimo, entre outras informações.

``` r

# Explorando os dados 
# Os comandos a seguir servem para conhecermos a estrutura dos dados e verificar 
# quais deles são numéricos e quais são categóricos
head(y)    # Visualização da planilha parcial
View(y)    # Visualização da planilha inteira
str(y)     # Exibe a estrutura interna de cada variável dentro do objeto 
summary(y) # Exibe o resumo de cada variável mostrando as amplitudes mínima e máxima, a média e a mediana

```

Agora nós vamos precisar manipular alguns dados da planilha para fazer o gráfico. Primeiro, iremos filtrar a coluna "Especies" e "N_individuos" e depois iremos contar quantos indivíduos por espécie registramos nas duas parcelas amostradas.

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

## Após a filtragem dos dados teremos a seguinte tabela de dados (y1):

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

Após contar o número de espécies por indivíduos, iremos vizualizar esses dados em um simples gráfico de barras. Aproveite para verificar quais espécies foram mais abundante e quais foram raras. 

``` r

# Construir um gráfico de barras para visualizar o número de indivíduos por espécie registrada
ggplot(y1, aes(Especie, N_individuos))+ 
  geom_col()

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1a_DAE.png"/>

## Organizando o gráfico em ordem crescente

Finalmente, temos um gráfico! Agora vamos deixá-lo mais intuitivo e utilizar a função "reorder" para ordenar as espécies de acordo com o número de indivíduos registrados.

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

## Intepretação dos resultados

Existiu diferença estatitica entre a riqueza e o número de espécies nas parcelas amostradas?

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

## Intepretação dos resultados

Existiu diferença estatítica entre a riqueza e o número de espécies na borda e no interior da Floresta?

-----

## Vamos exercitar um pouco de programação fazendo um gráfico de waffle? 

O gráfico de waffle é utilizado para representar proporções simples. Neste exercício, você poderá editar os argumentos da função e fazer um gráfico que conta a história da sua vida. Veja o exemplo abaixo e inspire-se. 

O link do exercício está em um dos quatro links dispoibilizados no ínicio desta página, lá onde está o link do nosso exercício de riqueza e abundância de espécies. Caso tenha alguma dúvida sobre o exercício é só seguir o tutorial abaixo.

- [Tutorial para fazer um gráfico de waffle `.pdf`](https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Tutotial_RStudio_Cloud_Waffle_Pronta_Cientista_2023_05_27.pdf)

## Edite o gráfico abaixo utilizando os dados da sua biografia

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1_waffle.png" align="center" width = "800px"/>

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

-----

## Bibliografia básica

- [Capítulo 2 - Voltando ao básico: como dominar a arte de fazer perguntas cientificamente relevantes `.html`](https://analises-ecologicas.netlify.app/cap2.html)

- [Capítulo 10 - Rarefação: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap10.html)

- [Capítulo 11 - Estimadores de riqueza: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap11.html)
 
-----

## Bibliografia complementar

- [Livro completo - Análises Ecológicas no R `.html`](https://analises-ecologicas.com/index.html)
