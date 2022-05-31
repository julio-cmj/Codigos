import math
##################################################################################################################################################
#3

#calcular os valores de f(x) e x

def f(x):
    y = 1/x
    return y

a = 1 
b = 3
subintervalos = 5
m = (b-a) / subintervalos
x = []
y = []

while a <= b:
    y.append(f(a))
    x.append(a)
    a = a + m

# valor h

def h(n):
    h = x[n+1] - x[n]
    return h

#valor fx n + fx n+1

def f(n):
    f = y[n]+y[n+1]
    return f

# somatório 

m=0
soma = []
for i in range(0,len(x)-1):
    s = h(i)/2 * f(i)
    soma.append (s)
    m = m+1


print (sum(soma))

##########################################################################################################################################
#2

#calcular valores de x e f(x)

x = [-1, 0 ,1, 2, 3]
y = [1 ,1, 0 ,-1 ,2]

#calcular os valores de h

def h(n):
    h = x[n-1]-x[n]
    return h

#calcular os valores de fx n + fx n+1

def f(n):
    f = y[n-1]+y[n]
    return f

#somatório

for i in range(0,len(x)-1):
    s = h(i)/2 * f(i)
    s = s + s

print (s)

##################################################################################################################################################
#4
#a

#calcular os valores de f(x) e x

def f(x):
    y = math.exp(x)
    return y

a = 0 
b = 1
subintervalos = 10
m = (b-a) / subintervalos
x = []
y = []

while a <= b:
    y.append(f(a))
    x.append(a)
    a = a + m

# valor h

def h(n):
    h = x[n+1] - x[n]
    return h

#valor fx n + fx n+1

def f(n):
    f = y[n]+y[n+1]
    return f

# somatório 

m=0
soma = []
for i in range(0,len(x)-1):
    s = h(i)/2 * f(i)
    soma.append (s)
    m = m+1


print (sum(soma))

#b - integral = 1.71828181

valor_integral = math.exp(1) - math.exp(0)

erro_relativo = sum(soma) - valor_integral
print (erro_relativo)

#c 

#calcular os valores de f(x) e x

def f(x):
    y = math.exp(x)
    return y

a = 0 
b = 1
subintervalos = 10
m = (b-a) / subintervalos
x = []
y = []

while a <= b:
    y.append(f(a))
    x.append(a)
    a = a + m

#valor fx n + fx n+1

def f(n):
    f = y[n]+y[n+1]
    return f

# somatório 

m=0
soma = []
for i in range(0,len(x)-1):
    s = 0.01/2 * f(i)
    soma.append (s)
    m = m+1


print (sum(soma))

m=0
soma = []
for i in range(0,len(x)-1):
    s = 0.001/2 * f(i)
    soma.append (s)
    m = m+1

print (sum(soma))

#####################################################################################################################################################
#5

def f(x):
    y = 1/(x+1)
    return y

a = 0
b = 3
subintervalos = 6
m = (b-a) / (subintervalos)

x=[]
while a <= b:
    x.append(a)
    a = a + m

y=[]
for i in x:
    p = f(i)
    y.append(p)

termos = []

for i in range(0,len(y)-1,2):
    h = (x[i+2]-x[i])/2
    termo = h/3 * (y[i]+4*y[i+1]+y[i+2])
    termos.append(termo)

integral = 0
for i in termos:
    integral = integral + i

print (integral)

######################################################################################################################
#6

def f(x):
    y = math.exp(x)
    return y

a = 0
b = 1
subintervalos = 10
m = (b-a) / (subintervalos)

x=[]
while a <= b:
    x.append(a)
    a = a + m

y=[]
for i in x:
    p = f(i)
    y.append(p)

termos = []

for i in range(0,len(y)-1,2):
    h = (x[i+2]-x[i])/2
    termo = h/3 * (y[i]+4*y[i+1]+y[i+2])
    termos.append(termo)

integral = 0
for i in termos:
    integral = integral + i

print (integral)