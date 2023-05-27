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
library(openxlsx)

# Salvar um arquivo com as duas planilhas unidas
write.xlsx(y, 'parcelas_1_e_2_juntas.xlsx')

# Abrir o pacote para manipular os dados 
library(dplyr) 
y1 <- y %>% select(Especie, N_individuos) %>% 
            count(Especie, N_individuos, sort=T)

# Abrir o pacote para manipular dados categóricos
# Agrupar as espécies pelo nome (sp1, sp2, etc) e contar o número de indivíduos
library(forcats)
y1 <- y1 %>% group_by(Especie) %>%
             summarize(N_individuos = sum(N_individuos))

library(ggplot2)
# Construir um gráfico de barras para visualizar o número de indivíduos por espécie
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

## Abrir os pacotes
#library(iNEXT)
#library(devtools)
#library(vegan)
#library(nlme)

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

###############
# Exercício 3 #
###############

# Utilizar dados simulados para para testar se existe diferença significativa
# entre a riqueza e a abundância de indivíduos na borda e no interior da floresta

# Ler as planilhas das parcelas amostradas e das parcelas simuladas
y4 <- read_excel("parcelas_1_e_2_juntas.xlsx", na = "-") # parcelas amostrada
y5 <- read_excel("parcelas_simulacao.xlsx", na = "-") # parcelas simuladas

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

#Salvar a figura 
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

