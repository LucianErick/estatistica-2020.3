  # Amostra dada
  dados = c(2.9, 3.4, 3.5, 4.1, 4.6, 4.7, 4.5, 3.8, 5.3, 4.9, 4.8, 5.7, 5.8, 5.0, 3.4, 5.9, 6.3, 4.6, 5.5, 6.2)
  
  # Histograma
  hist(dados, freq = FALSE)
  curve(dnorm(x,mean=mean(dados),sd=sd(dados)),col=2,lty=2,lwd=2,add=TRUE)
  
  # Grafico de probabilidade (QQ)
  qqnorm(dados, main = "", xlab = "Quantis te?ricos N(0,1)", pch = 20,
         ylab = "Tempo de rea??o (em minutos)")
  qqline(dados, lty = 2, col = "red")
  
  # Teste de Shapiro-Wilk
  
  # O p-valor eh de 0.5986. Isto indica que os dados sao normais,
  # pois p-valores menores que 0.05 sao os casos onde os dados
  # nao apresentam normalidade.
  shapiro.test(dados)