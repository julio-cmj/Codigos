# Método de Gauss Jacobi para cálculo de sistema de equações lineares
# Ver critério convergência para o método


# função que calcula subtração entre listas 
def subtração_lista(x,Xn):
    subtração = []
    for item1, item2 in zip(Xn, x):
        item = item1 - item2
        subtração.append(abs(item)) # valor absoluto ou em módulo
    return subtração

# sistema de equações lineares em formato de matriz
A = [[10,2,1],[1,5,1],[2,3,10]]
B = [7,-8,6]

# chute inicial da solução do sistema, X0
x = [0.7,-1.6,0.6]

# método
while True:
    # Cálculo dos novos valores de Xn
    Xn = []
    for i in range(0,len(A)):
        a = A[i]
        X = B[i]
        for j in range (0,len(A)):
                if j != i:
                    X = X - a[j] * x[j]
                elif j == i:
                    continue
        X = X/a[i]

        # novos valores para o chute, Xn 
        Xn.append(round(X,5)) # arrendondado em 5 casas decimais


    # critério de parada, máx|x1 - x0| / máx |x1| < e
    subtração = subtração_lista(x,Xn)
    e = max(subtração) / max(Xn)
    if e < 0.05:
        x = Xn  
        break

    x = Xn

# Resultado    
print (x)

# ou utilizando numpy
#x = np.linalg.solve(A,B)