
#### Questao 4

# Amostra dada
dados = c(7,11,8,9,10,14,6,8,8,7,8,10,10,14,12,
14,12,9,11,13,13,8,6,8,13,10,14,5,14,10)

# Testando H0: mu = 12
t.test(dados, mu = 12)
# Portanto, H0 deve ser rejeitado!

# Testando H1: mu < 12
t.test(dados, mu = 12, alternative = "less")

# Calculando o valor p
t.obs = -3.856
pt(t.obs, df=29)
