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

Sys.setlocale("LC_ALL","pt_BR.UTF-8")

###############
# Exercício 1 #
###############

# Construir um gráfico de Distribuição de Abundância de Espécies 
# das parcelas amostradas em campo (Parcela_1 e Parcela_2) 

# Abrir o pacote que lê arquivos do Excel (extensões .xls ou .xlsx)
library(readxl) 

# Criar um objeto (ex.: y1) para armazenar a planilha do Excel
p1 <- read_excel("parcela1_lado_esquerdo.xlsx", na = "-")
p2 <- read_excel("parcela2_lado_direito.xlsx", na = "-")

# Juntar as duas planilhas 
y <- rbind(p1, p2)

# Abrir o pacote que cria arquivos do Excel (extensões .xls ou .xlsx)
# Salvar um arquivo com as duas planilhas unidas
library(openxlsx)
write.xlsx(y, 'parcelas_1_e_2_juntas.xlsx')

# Estudando os dados
head(y)     # Visualização da planilha parcial
View(y)     # Visualização da planilha inteira
class(y)    # Saber qual é a classe dos dados
str(y)      # Exibe a estrutura interna de um objeto 
summary(y)  # Exibe o resumo para cada variável (amplitudes mínima e máxima, média e mediana)

# Abrir o pacote para manipular os dados 
library(dplyr) 
y1 <- y %>% select(Especie, N_individuos) %>% 
            count(Especie, N_individuos, sort=T)

# Abrir o pacote para manipular dados categóricos
# Agrupar as espécies pelo nome (sp1, sp2, etc) e contar o número de indivíduos
library(forcats)
y1 <- y1 %>% group_by(Especie) %>%
             summarize(N_individuos = sum(N_individuos))

# Abrir pacote para construir gráficos
# Construir um gráfico de barras para visualizar o número de indivíduos por espécie
library(ggplot2)
ggplot(y1, aes(Especie, N_individuos)) + 
  geom_col()

# Ordenar o número de indivíduos por espécie  
ggplot(y1, aes(reorder(Especie, N_individuos), N_individuos)) +
  geom_col()

# Ordenar o número de indivíduos por espécie em ordem decrescente para
# visualizarmos a Distribuição de Abundância das Espécies (DAE), desta forma,
# poderemos identificar facilmente quais são as espécies mais abundantes 
# e quais são as mais raras
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos)) +
  geom_col()

# Colorir as barras do gráfico e renomear as etiquetas (x,y) do gráfico
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos)) +
  geom_col(fill = "#009E73") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")

# Limpar o fundo do gráfico e as linhas (x, y) dos painéis 
# utilizando a função 'theme'
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos)) +
  geom_col(fill = "#009E73") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw() + 
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank())+ 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank())

# Aumentar o tamanho da letra dos eixos x e y
# editando o argumento (axis.text.x=element_text(size=12)) da função 'theme' 
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos)) +
  geom_col(fill = "#009E73") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw() +
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank()) +
  theme (axis.text.x=element_text(size=12)) +
  theme (axis.text.y=element_text(size=12))

# Salvar a figura final em formato .png
# Para salvar o gráfico é necessário utilizar a função 'png' antes da função 'ggplot' 
# e a dev.off() na última linha
png(file="Figura1_DAE.png", width = 1000, height = 600) 
ggplot(y1, aes(reorder(Especie, -N_individuos, sum), N_individuos)) +
  geom_col(fill = "#009E73") +
  labs(x = "Nome das espécies", y = "Número de indivíduos (n)")+
  theme_bw() +
  theme (panel.grid.major.y = element_blank(), 
         panel.grid.minor.y = element_blank()) + 
  theme (panel.grid.major.x = element_blank(), 
         panel.grid.minor.x = element_blank()) +
  theme (axis.text.x=element_text(size=12)) +
  theme (axis.text.y=element_text(size=12))
dev.off() 

```

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura1_DAE.png" align="center" width = "800px"/>

Figura 4.  Gráfico de barras mostrando a Distribuição de Abundância de Espécies das duas parcelas amostradas.

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

<img src="https://github.com/fblpalmeira/pronta_cientista/blob/main/data/Figura2_Rarefacao_Parcelas_1_e_2.png" align="center" width = "800px"/>

Figura 5.  Gráfico de barras mostrando a Distribuição de Abundância de Espécies das duas parcelas amostradas.

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

# Comparar as duas parcelas de amostragem (Parcela_1 e Parcela_2)
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

<img src="" align="center" width = "800px"/>

Figura 6.  Gráfico de barras mostrando a Distribuição de Abundância de Espécies das duas parcelas amostradas.

-----

## Bibliografia básica

- [Capítulo 10 - Rarefação: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap10.html)

- [Capítulo 11 - Estimadores de riqueza: Análises Ecológicas no R `.html`](https://analises-ecologicas.netlify.app/cap11.html)
 
-----

## Bibliografia complementar

- [Livro completo - Análises Ecológicas no R `.html`](https://analises-ecologicas.com/index.html)
