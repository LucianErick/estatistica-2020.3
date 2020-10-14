# Gerando/simulando 1000 valores/dados de uma normal: N(100, 100)
k.valores = 1000
# M?dia e vari?ncia te?rica
mu = 100
sigma2 = 100

# Gerando os dados e plotando gr?ficos
y = rnorm(k.valores, mu, sd = sqrt(sigma2))

# freq = FALSE: retangulos correspondem a densidades e 
# Area total dos retangulos igual a 1
hist(y, main="Histograma do valor de 1000 valores quaisquer e Curvas Normais",
     freq = FALSE,
     ylim = c(0,0.1)
) 
curve(dnorm(x, mean=media.dados, sd=dp.dados), # Curva normal para os dados
      from=min(y), to=max(y), add=T)
curve(dnorm(x, mu, sqrt(sigma2)), # Curva normal teorica
      from = min(y), to=max(y), 
      add=T,
      col="blue")

#    Simulando/Observando o peso medio ao coletar/inspecionar 
# k.amostras de tamanho 16 pacotes
k.amostras = 1000
n.tamanho.amostral = 16
mu = 100
sigma2 = 100

vetor.amostras.x.barra = c()
for (i in 1:k.amostras) {
  x.16.pacotes = rnorm(n.tamanho.amostral, mu, sqrt(sigma2))
  
  vetor.amostras.x.barra[i] = mean(x.16.pacotes)
}

media.xbar  = mean(vetor.amostras.x.barra)
desvio.xbar = sd(vetor.amostras.x.barra)
# Verificando
media.xbar
desvio.xbar
# Obs: Teoricamente: desvio.xbar = dp / raiz(n) = 100 / raiz(100) = 1

x = vetor.amostras.x.barra
sigma = sqrt(sigma2)
# Observacao grafica
hist(vetor.amostras.x.barra, 
     main="Histograma do valor médio de uma amostra de 16 elementos com 1000 valores",
     freq=FALSE,
     ylim=c(0,0.4)
)
curve(dnorm(x, mean=media.xbar, sd=desvio.xbar),
      from=min(vetor.amostras.x.barra), to=max(vetor.amostras.x.barra),
      add=T) # Curva normal das medias observadas
curve(dnorm(x, mu, sigma/sqrt(n.tamanho.amostral)),
      from = min(vetor.amostras.x.barra), to=max(vetor.amostras.x.barra), 
      add=T,
      col="red") # Curva normal teorica da distribuicao amostral da media

install.packages("scales")
library(scales)
hist(y, main="Média (rosa) e Valor médio (roxo; n=16) de 1000 Valores", 
     freq = T,
     xlim = c(70,130),
     #ylim = c(0, 0.45),
     ylim = c(0, 500),
     col=alpha("red", 0.7))
hist(vetor.amostras.x.barra, 
     freq = T,
     main=NULL,
     col=alpha("blue", 0.5),
     add=T)

