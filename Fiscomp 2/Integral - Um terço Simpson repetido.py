#método 1/3 de Simpsom repetido para o cálculo de uma integral

a = 1
b = 1
subintervalos = 1
m = (b-a) / (subintervalos)
x = []
y = []

#função f(x)
def f(x):
    y = 1
    return y

#calculo de f(x) e x
while a <= b+(m/10):
    x.append(a)
    a = (a + m)

for i in x:
    p = f(i)
    y.append(p)

#termos do somatório h/3 * (y[0]+4y[1]+y[2])
termos = []
for i in range(0,len(y)-1,2):

    # calculo h 
    h = (x[i+2]-x[i])/2

    termo = h/3 * (y[i]+4*y[i+1]+y[i+2])
    termos.append(termo)

#somatório 
integral = 0
for i in termos:
    integral = integral + i


#resultado
print ("Valor aproximado da integral=",integral)
