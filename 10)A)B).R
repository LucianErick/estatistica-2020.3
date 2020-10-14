#A) Como a proporção de defeituosos em uma caixa de 100 unidades tem uma distribuição 
# X ~ N(0.1, (0.1 * 0.9) / 100) e ao normalizar ter como resultado X ~ N(Z > 0)
# temos que:
result = pnorm(0)
result # 0.5

#B) Como a aproximação normal não é recomendável pois o evento {x' <= 0} não faz sentido e {x' = 0} tem probabilidade zero
result2 = dbinom(0, 100, 0.1)
result2 # ~ 2.65614e-05
