#UTF-8

# ==== Gráfico Binomial Exato =====
n=100
p=0.1
# Gera/Simula 100 dados de X ~ Binomial(n=10, p=0.1)
x=rbinom(100, n, p)
hist(x, probability=TRUE, ylab="Densidade",
     col="pink", 
     main="Distribuição de probabilidade exata",
     ylim=c(0,0.25),
     xlim=c(0,25))

# === Gráfico da aproximação da Binomial pela Normal

k.amostras = 1000
n.tamanho.amostral = 100
n = 1
p = 0.10  # Probabilidade de sucesso de 10%

#  Gerando dados/proporções amostrais: 
vetor.amostras.x.barra = c()
for (i in 1:k.amostras) {
  x.bernoullis = rbinom(n.tamanho.amostral, n, p)
  vetor.amostras.x.barra[i] = mean(x.bernoullis)
}

media.xbar  = mean(vetor.amostras.x.barra)
desvio.xbar = sd(vetor.amostras.x.barra)
dp.bernoulli = sqrt(p*(1-p))
dp.xbar.teorico = dp.bernoulli / sqrt(n.tamanho.amostral)

# Graficos das Simulações
vetor.amostras.x.barra
hist(vetor.amostras.x.barra, freq = FALSE, ylab="Densidade",
     col="pink", 
     main="Proporções amostrais (n=100) de 1000 peças inspecionadas",
     sub = "Com Curva da Normal Teórica da Proporção Amostral",
     ylim=c(0,80),
     xlim=c(-0.0001, 0.25)
)
# Grafico da Distribuição amostral da proporção: 
# Normal Teórica (p, p x (1-p) / n) 
x = vetor.amostras.x.barra
curve(dnorm(x,mean=p, sd=dp.xbar.teorico),
      from = min(vetor.amostras.x.barra),
      to= max(vetor.amostras.x.barra),
      add = T) 




