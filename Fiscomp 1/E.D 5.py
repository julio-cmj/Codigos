import math

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


# Método da Posição Falsa

print("Método da Posição Falsa")

a = 0.5
b = 1
k = 0
x_k1 = x0
xk = (a*f(a)-b*f(b))/(f(a)-f(b))

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

    if math.copysign(f(xk), 1) < epsilon1:
        break
    if math.copysign((xk-x_k1), 1) < epsilon2:
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

    if math.copysign(f(xk), 1) < epsilon1:
        break
    if math.copysign((xk-x_k1), 1) < epsilon2:
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

    if math.copysign(f(xk), 1) < epsilon1:
        break
    if math.copysign((xk-x_k1), 1) < epsilon2:
        break
    if k > 100:
        print("Excedido o número de iterações")
        break
