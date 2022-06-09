# Método de Gauss Jacobi para cálculo de sistema de equações lineares

# função que calcula subtração entre listas 
def subtração_lista(x,y):
    subtração = []
    for item1, item2 in zip(y, x):
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
    # termos da equação isolados
    x0 = (7-2*x[1]-x[2])*1/10
    x1 = (-8-x[0]-x[2])*1/5
    x2 = (6-2*x[0]-3*x[1])*1/10

    # novos valores para o chute, Xn
    y = [round(x0,5),round(x1,5),round(x2,5)]  # arredondado em 5 casas decimais porque o python buga 

    # critério de parada, máx|x1 - x0| < e
    subtração = subtração_lista(x,y)
    e = max(subtração)
    if e < 0.05:
        x = y  
        break

    x = y

# Resultado    
print (x)
