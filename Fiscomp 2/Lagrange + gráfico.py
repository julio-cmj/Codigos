import matplotlib.pyplot as plt
def f(x):
    y = (2/3)*x**2+(-7/3)*x+(1)
    return y

#xs = [-1.0, 0, +2.0]
##ys = [+4.0, +1.0, -1.0]

# Passa os valores de x e f(x) para as listas sx[] e sfx[]-
sx = []
sfx = []
x = 1
while True:
    sx.append(x)
    sfx.append(f(x))
    x = x + .1 # Incremento no valor de x
    if (x > 10): # Limite maximo para x
        break

# Gera os graficos
plt.plot(sx,sfx, 'y')
#plt.plot(xs,ys,'ro')
plt.title('Example')
plt.xlabel('x')
plt.ylabel('y')
plt.grid(True)
plt.show()