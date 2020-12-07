tempos <- c(2.9, 4.8, 3.4, 5.7, 3.5, 5.8, 4.1, 5.0, 4.6, 3.4, 
            4.7, 5.9, 4.5, 6.3, 3.8, 4.6, 5.3, 5.5, 4.9, 6.2)

media <- 5

test <- t.test(tempos, mu = media, alternative = "less")
test

# Testando para Alfa = 5%
testToAlpha5 <- t.test(tempos, mu = media, alternative = "less", conf.level = 0.95)
testToAlpha5


# Testando para Alfa = 1%
testToAlpha1 <- t.test(tempos, mu = media, alternative = "less", conf.level = 0.99)
testToAlpha1

### CONCLUSAO

# O Resultado é, de certa forma, intuitivo. Pois ao analisarmos a amostra em questão
# conseguimos tirar como media amostral um valor menor do que a média assumida na hipótese
# H0. Além disso, ao diminuir o nível de significância, aumentamos a probabilidade de rejeitarmos
# H0.
