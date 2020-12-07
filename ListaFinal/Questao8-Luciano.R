# instalando e utilizando bibliotecas necessárias
install.packages("tidyverse")
library(tidyverse)
library(ggplot2)

# informando o local onde está a base de dados
# DEVE-SE ALTERAR AO MUDAR DE COMPUTADOR!!!
setwd("./Downloads/Estatistica/ListaFinal")

# realizando a leitura dos dados
dados = read.csv("02_Dados_Amamentacao_Cancer.csv")

# buscando os dados da coluna referente ao cancer
cancer = array(unlist(dados %>% select(cancer)))
# analisando as métricas da coluna
summary(cancer)

# buscando os dados da coluna referente à amamentação
amamentacao = array(unlist(dados %>% select(amamentacao)))
# analisando as métricas da coluna
summary(amamentacao)

# a planilha completa já não é mais necessária então pode ser removida
remove(dados)

# gerando uma tabela com os dados obtidos da planilha
dados.table = table(cancer, amamentacao)
dados.table

# Realizando os testes

# Inicialmente, realizando o teste Qui-quadrado de Pearson com a tabela
# gerada
chisq.test(dados.table, correct = TRUE)
# foi obtido um p-valor de 0.005268, o que dá indícios de uma associação
# entre as duas variáveis

# Agora, realizando um teste de igualdade entre as proporções
prop.test(dados.table, correct = TRUE, alternative = "two.sided")
# Foi obtido um p-valor igual o anterior, e os valores das estimativas foram:
# 0.2541528 e 0.3314394, onde a diferença de valor é diferente de 0.
# Portanto, o fato de amamentar é um fator de proteção para o câncer
# de mama.


