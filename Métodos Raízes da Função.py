def f(x):
    y = (x**3)-(9*x)+5
    return y

def g(x):
    y = -5/(x**2-9)
    return y

def D_f(x):
    y = (3*x**2)-(9)
    return y


x0, epsilon1, epsilon2 = input().split(" ")
x0 = float(x0)
epsilon1 = float(epsilon1)
epsilon2 = float(epsilon2)

# Método bissecção

print ("Método da Bissecção")
a=0
b=1
k=0
while k<100:
    x=(a+b)/2
    if f(x)*f(a)>0:
        a=x
    else:
        b=x
    k=k+1
    print ("k=",k,"a=","%0.3f"%a,"b=","%0.3f"%b)
    if abs (b-a) < 0.01:
        break


# Método da Posição Falsa

print("")
print("Método da Posição Falsa")

a = 0
b = 1
k = 0
x_k1 = x0
xk = (a*f(b)-b*f(a))/(f(b)-f(a))

while True:
    if f(b) < 0 and f(xk) < 0:
        b = xk
    elif f(a) < 0 and f(xk) < 0:
        a = xk
    elif f(b) > 0 and f(xk) > 0:
        b = xk
    elif f(a) > 0 and f(xk) > 0:
        a = xk
    elif f(a) > 0 and f(b) > 0 and f(xk) < 0:
        a = xk

    x_k1 = xk
    xk = (a*f(a)-b*f(b))/(f(a)-f(b))
    k = k+1

    print("{:3d} {:.6f} {:.6f}".format(k, xk, f(xk)))

    if abs (f(xk)) < epsilon1:
        break
    if abs ((a-b)) < epsilon2:
        break
    if k > 100:
        print("Excedido o número de iterações")
        break


# Método do Ponto Fixo

print("")
print("Método do Ponto Fixo ")

k = 0
x_k1 = x0
if x0 == 3 or x0 == -3:
    print ("não definido para x0 = 3 ou -3")
else:
    xk = g(x_k1)

while True:
    if x0 == 3 or x0 == -3:
        break

    x_k1 = xk
    xk = g(x_k1)
    k = k+1

    print("{:3d} {:.6f} {:.6f}".format(k, xk, f(xk)))

    if abs(f(xk)) < epsilon1:
        break
    if abs((xk-x_k1)) < epsilon2:
        break
    if k > 100:
        print("Excedido o número de iterações")
        break


# Método de Newton-Raphson

print("")
print("Método de Newton-Raphson")

k = 0
x_k1 = x0
xk = x_k1 - (f(x_k1))/(D_f(x_k1))

while True:

    x_k1 = xk
    xk = x_k1 - (f(x_k1))/(D_f(x_k1))
    k = k+1

    print("{:3d} {:.6f} {:.6f}".format(k, xk, f(xk)))

    if abs(f(xk)) < epsilon1:
        break
    if abs((xk-x_k1)) < epsilon2:
        break
    if k > 100:
        print("Excedido o número de iterações")
        break

# Método Secante

print("")
print ("Método Secante")

a = 0 
x_k1 = x0
k = 0

while True:

    xk = a - (f(a)*(a-x_k1))/(f(a)-f(x_k1))
    k= k + 1

    if f(x_k1) < 0 and f(xk) < 0:
        x_k1 = xk
    elif f(a) < 0 and f(xk) < 0:
        a = xk
    elif f(x_k1) > 0 and f(xk) > 0:
        x_k1 = xk
    elif f(a) > 0 and f(xk) > 0:
        a = xk
    elif f(a) > 0 and f(x_k1) > 0 and f(xk) < 0:
        a = xk

    print("{:3d} {:.6f} {:.6f}".format(k, xk, f(xk)))

    if abs(f(xk)) < epsilon1:
        break
    if abs((a-x_k1)) < epsilon2:
       break
    if k > 100:
        print("Excedido o número de iterações")
        break