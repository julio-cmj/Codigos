# Método das potências para o cálculo do maior autovalor e autovetor de uma matriz 

import numpy as np

# Matriz A 
A = np.array ([[1,0,0],[2,3,0],[3,4,2]])

# Chute inicial do autovetor, X1
x1 = np.array ([[1],[1],[1]])

# Método 
k = 0
while True:
    # multiplicação das matrizes, AX = A * x
    AX =np.dot(A,x1)

    #norma do vetor AX
    AXm = np.linalg.norm(AX)   #(AX[0]**2+AX[1]**2+AX[2]**2)**(1/2)

    # próxima aproximação do autovetor, normalização da matriz (AX) obtida pela multiplicação 
    autovetor = AX * 1/AXm

    # próxima aproximação do autovalor, multiplicação da transposta de AX * autovetor
    autovalor = np.dot(AX.T,autovetor)

    # contador de iterações
    k = k+1

    # critério de parada por: det|autovalor * I - A| = 0
    I = np.identity(len(A))
    a = autovalor[0,0] * I - A
    if np.linalg.det(a) == 0:
       break

    # critério de parada por número máximo de iterações
    #if k>14:
        #break     

    x1 = autovetor


# Resultados
print("autovalor=",autovalor[0,0])
print("autovetor=",np.around(autovetor.ravel(),5)) # arredondado em 5 casas decimais
#print (k)