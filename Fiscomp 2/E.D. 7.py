# Método Gauss-jacobi para o cálculo de um sistema linear

#chute inicial x0
x = [0.7,-1.6,0.6]
k=0

while k<3:
    # sistema linear em função da primeira, segunda e terceira variaveis
    x0 = (7-2*x[1]-x[2])*1/10
    x1 = (-8-x[0]-x[2])*1/5
    x2 = (6-2*x[0]-3*x[1])*1/10

    # substituir os valores para a próxima aproximação
    x[0] = round(x0,5) 
    x[1] = round(x1,5)
    x[2] = round(x2,5)
    
    k= k+1
    # aproximação para a resposta do sistema
    print (x)


#############################################################################################################################################################################
# Método das potências para o calculo do maior autovetor e autovalor de uma matriz

import numpy as np

#Matriz A e chute inicial x1

A = np.array ([[3,2],[2,3]])
x1 = np.array ([[1],[0]])

# Iteração do autovalor e autovetor

k=0
while k<4:
    # multiplicação das matrizes, AX = A * x
    AX =np.dot(A,x1)

    #norma do vetor AX
    AXm = np.linalg.norm(AX)   #(AX[0]**2+AX[1]**2+AX[2]**2)**(1/2)

    # normalização da matriz obtida pela multiplicação, igual ao autovetor
    autovetor = AX * 1/AXm

    # calculo do autovalor = transposta de AX * autovetor
    autovalor = np.dot(AX.T,autovetor)


    x1 = autovetor
    k = k+1

print((autovalor[0,0]))

print(np.around(autovetor.ravel(),7))