#Método trapézio repetido calculo da integral

a = 1
b = 1
subintervalos = 1
m = (b-a) / subintervalos
x = []
y = []

#função f(x)

def f(x):
    y = 1
    return y

#calcular os valores de f(x) e x

while a <= b+(m/10):
    y.append(f(a))
    x.append(a)
    a = (a + m)

#valor de h 

def h(n):
    h = x[n+1]-x[n]
    return h

#valor fx n + fx n+1

def f(n):
    f = y[n]+y[n+1]
    return f

#somatório 

soma = []
for i in range(0,len(x)-1):
    s = h(i)/2 * f(i)
    soma.append (s)

print ("Valor aproximado da integral=",sum(soma))