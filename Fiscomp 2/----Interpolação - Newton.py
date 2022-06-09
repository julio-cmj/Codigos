# Método de Newton para o interpolação de uma função

# valores tabelados
x = [20,25,30,35,40,45,50]
y = [0.99907,0.99852,0.99826,0.99818,0.99828,0.99849,0.99878]
n_variaveis = len(x) #números de variáveis em x

#
dely=[]
for i in range(0,n_variaveis):
    dely.append(y[i])

#
for k in range(1,n_variaveis):
    for i in range(n_variaveis,k,-1):
        dely[i-1] = (dely[i-1] - dely[i-2]) / (x[i-1] - x[i-k-1])

#
fx = dely[n_variaveis-1]

# cálculo de um ponto da função interpolada
X = 32.5
for i in range(n_variaveis-1,0,-1):
    fx = fx * (X-x[i-1]) + dely[i-1]

# Resultado
print ("x=",X," y=","%f" %fx)


    

