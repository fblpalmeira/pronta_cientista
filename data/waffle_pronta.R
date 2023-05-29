install.packages("waffle") #Função que instala o pacote (waffle)
library('waffle') #Função que abre o pacote (waffle)

# Exemplo utilizando os dados fictícios
png(file="Figura1_waffle.png", width = 1000, height = 600)
parts <- c('Infância'= 12, 'Adolescência' = 6, 'Graduação' = 4, 'Mestrado' = 2, 
           'Doutorado'= 4, 'Pós-Doutorado' = 2) #Criar objeto para inserir os dados que serão visualizados
waffle(parts, rows = 4, title = "A minha vida de cientista em um gráfico de waffle", 
       xlab="1 quadrado = 12 meses")+
       theme(legend.text = element_text(size = 15), axis.title.x=element_text(size = 20))+
       labs(caption = "@prontapracientista") #Função que tem o mesmo nome que o pacote (waffle) e que gera o gráfico
dev.off()

# Faça o seu gráfico aqui - Modelo 1
png(file="Figura2_waffle.png", width = 1000, height = 600)
parts <- c('Maternal'=1, 'Jardim'=3, 'Ensino Fundamental' = 4, 'Ensino Médio' = 5)
waffle(parts, rows=3, title = "A minha vida em um gráfico de waffle", 
       xlab = "1 quadrado = 12 meses")+
       theme (legend.text =element_text (size = 15), axis.title.x=element_text(size = 20))+
       labs(caption = "@Seu nome")
dev.off()

# Invente um gráfico de proporções - Modelo 2
png(file="Figura3_waffle.png", width = 1000, height = 600)
parts <- c('Exemplo1' = 12, 'Exemplo2' = 36, 'Exemplo3' = 48, 'Exemplo4' = 60)
waffle(parts, rows = 12, title = "Edite o título", 
       xlab = "1 quadrado = 10 unidades")+
       theme (legend.text = element_text (size = 15), axis.title.x = element_text(size = 20))+
       labs(caption = "@Seu nome")
dev.off()
