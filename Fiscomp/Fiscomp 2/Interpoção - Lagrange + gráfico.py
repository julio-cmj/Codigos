# Método de lagrande para interpolação de funções + gráfico

import matplotlib.pyplot as plt

#função do calculo dos Ln 
def L(n, x, k, xs):
    j = 0
    numerador = 1
    denominador = 1
    while (j<=n):
        if (j!=k):
            numerador = numerador * (x - xs[j])
            denominador = denominador * (xs[k] - xs[j])
        j = j + 1
    L = numerador / denominador
    
    return L

#calculo da função interpoladora Pn(x)
def pn(n,x,xs,ys):
    i=0
    pn =0
    while(i<=n):
        pn = pn + ys[i]*L(n,x,i,xs)
        i = i + 1
       
    return pn

#valores tabelados
xs = [0,2]
ys = [1,-1]
n = len(xs)-1

#valor incial para x
x= 0

#Valores da função interpolada
xx = []
yy = []
while(x<=2.01):  #valor máximo para x
    print("x= ", "%0.2f" %x ,"p(x)= ", "%0.2f"%pn(n,x,xs,ys))
    xx.append(x)
    yy.append(pn(n,x,xs,ys))    

    #intervalo dos valores para x
    x = x + 0.1

#Grafico p(x)
plt.plot(xs,ys,"ro")
plt.plot(xx,yy,color='blue')
plt.xlabel('x')
plt.ylabel('p(x)')
plt.show()