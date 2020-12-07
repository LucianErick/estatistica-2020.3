# ------------------------------------------ Questão 9 ----------------------------------------------

#importando bibliotecas que serao usadas nessa questao 
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)


#settando diretorio de trabalho (Que muda de acordo com a maquina em que esse codigo estiver rodando)
setwd("./Downloads/Estatistica/ListaFinal")



#9.2
# A base de dados usada eh disponibilizada pelo US Departament of Energy e contem basicamente as 
# informacoes de diversos carros e suas caracteristicas como milhas por galao (mpg), tamanho do motor,
# tipo da injecao, quantidade de cilindros, etc.
# link para acessar mais base de dados como essa: https://www.fueleconomy.gov/feg/download.shtml
carros2018 <- read.csv("cars2018.csv")

# Dando uma pequena olhada em como os dados estao dispostos
glimpse(carros2018)



#9.2 a)
# A variavel continua escolhida para o estudo eh o mpg(milhas por galao) dos carros. Queremos observar 
#quais outras variaveis influenciam na eficiencia do gasto de combustivel.

# MPG: variavel dependente 

# Nessa grafico de dispercao observamos que existe uma correlacao linear negativa entre displacement e mpg. 
# O que se pode dizer nessa analise eh que quanto maior a acelaracao do carro, mais ele gasta combustivel.
plot <- ggplot(carros2018)
plot + geom_point(aes(x = displacement, y = mpg))

# A base de dados escolhida para trabalho envolve outras 12 variaveis, mas como o objeto de estudo eh 
# correlacao linear simples, iremos considerar apenas duas variaveis desse data frame, que sao as mesmas 
# analisadas no plot acima.
mpg <- array(unlist(carros2018 %>% select(mpg)))
displacement <- array(unlist(carros2018 %>% select(displacement)))
rm(plot, carros2018) 

#analise descritiva da variavel dependente 
summary(mpg)

#analise descritiva da variavel independente
summary(displacement)



#9.2 b)
# Aqui calculamos com a funcao cor o coeficiente de correlacao linear entre essas duas variaveis. Como 
# analisado anteriormente, temos uma correlacao negativa e por termos diversos pontos atipicos, a correlacao
# nao eh tao forte
cor(displacement, mpg)



#9.2 c)
#Realizando analise de regressao simples.
#A execucao do comando lm(displacement~mpg) retorna o valor dos coeficientes de β0 e β1 estimados via Metodo de 
# Minimos Quadrado.
#Logo, a equação da reta ajustada é dada por Y = 7.1550 - 0.17514Xi
fit = lm(displacement~mpg)
fit

# A chamada summary(fit) gera resultados como erro padrao (std.error) das estimativas dos coeficientes de regressao 
#EP(β0) = 0.112219 e EP(β1) = 0.004704. Alem disso temos o valor do coeficiente de determinacao (multiple R squared).
summary(fit)

# Realizando teste de hipotese 
cor.test(displacement, mpg)
# Como o Valor P do teste (p-value < 2.2e-16) é bem pequeno, conclui-se que o valor do Coeficiente de Correlação Linear
# de Pearson tem certa significância Estatística.


  



