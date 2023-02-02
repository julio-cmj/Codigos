#1
#a - par ou impar
n = 1203981902740911
if (n%2 == 0):
    print ("par")
else:
    print ("ímpar")

#b - maior numero 
x = [12,3]
max (x)

#c - fatorial
import math
print (math.factorial (4))

#ou

n=4
fatorial = 1
for x in range (1,n+1):
    fatorial = x * fatorial
print (fatorial)

#d - produto escalar
import math 

xx = [1, 2, 3]
yy = [0, -2, 1]
angulo = 0

def produto_escalar (x,y,angulo):
    xy = x[0]*y[0] + x[1]*y[1] + x[2]*y[2] 
    produto = xy * math.cos(angulo)
    return produto

print (produto_escalar(xx,yy,angulo))

#e - soma vetorial (mesmo angulo) e produto vetorial
import math
xx = [1, 2, 3]
yy = [0, -2, 1]

def soma(x,y):
    soma = [x[0] + y[0] , x[1] + y[1] , x[2] + y[2]]
    return soma

print (soma(xx,yy))

def produto_vetorial(x,y,angulo):
    Xm = (x[0]**2 + x[1]**2 + x[2]**2) ** (1/2)
    Ym = (y[0]**2 + y[1]**2 + y[2]**2) ** (1/2)
    produto = Xm * Ym * math.sin (angulo)
    return produto

angulo = math.pi / 2

print (produto_vetorial(xx,yy,angulo))

#2 - somatorio
soma = 0
for x in range (0,11):
    x = x ** 2
    soma = x + soma
print (soma)

#3 
#1  def soma(L):
#2      total=___
#3      for e in L:
#4          total = ____ + e
#5      return(total)
#6  def media(L)
#7      mm = _______/len(L)
#8      return(m)  <----- return (mm)
#9  L = [6.3,8.0,7.5,9.2]
#10 print (L)
#11 print (media(L))

def soma(L):
    total = 0
    for e in L:
        total = total + e
        print ("total =",total)
    return(total)

def media(L):
    mm = soma (L)/len(L)
    return(mm)
L = [6.3,8.0,7.5,9.2]
print (L)
print (media(L))

#4 - media de uma lista
def media(L):
    total = 0
    n = 0
    for e in L:
        total = total + e
        n = n + 1
    media = total / n
    return(media)

L = [6.3,8.0,7.5,9.2]
print (media(L))

#5 - media lista e função
def media(L):
    total = 0
    n = 0
    for e in L:
        total = total + e
        n = n + 1
    media = total / n
    return(media)

def f(x):
    y = (x**2) + 1
    return y


x = [0.1 , 0.3 , 0.5 , 0.9 , 1.3 , 2.0]
print (media(x))

y = []
for X in x:
    y.append (f(X))

print (media(y))

#6 - soma e produto vetorial
def escalar(x,y):

    produto = x[0]*y[0] + x[1]*y[1] + x[2]*y[2]

    return (produto)
xx = [0.0, 1.0, 2.0]
yy = [-1.0, 0.0, 3.0]
zz = []
i = 0
while i<len(xx):
    zz.append(xx[i]+yy[i])
    i = i + 1

def produto_vetorial(x,y,angulo):
    Xm = (x[0]**2 + x[1]**2 + x[2]**2) ** (1/2)
    Ym = (y[0]**2 + y[1]**2 + y[2]**2) ** (1/2)
    produto = Xm * Ym * math.sin (angulo)
    return produto

angulo = 0

print ("Produto Escalar de x.y = %.f" % escalar(xx,yy))
print ("Soma Vetorial de x + y = %.f i + %.f j + %.f k" % (zz[0],zz[1],zz[2]))
print ("produto vetorial de x.y = %.f" %produto_vetorial(xx,yy,angulo))