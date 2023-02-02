# Métodos para encontrar a raíz de uma função

# Função que será interpolada
# Função f(x)
def f(x):
    y = (x**3)-(9*x)+5
    return y

# Função inversa de f(x)
def g(x):
    y = -5/(x**2-9)
    return y

# Derivada de f(x)
def D_f(x):
    y = (3*x**2)-(9)
    return y

# Chute inicial para x
x0 =1

# Critérios de aproximação
epsilon1 = 0.01
epsilon2 = 0.01

#x0, epsilon1, epsilon2 = input().split(" ")
#x0 = float(x0)
#epsilon1 = float(epsilon1)
#epsilon2 = float(epsilon2)

#######################################################################################################################################################################
# Método bissecção
print ("Método da Bissecção")

# Chute do intervalo no qual estará a raíz, a < r < b
a=0
b=1

# Método
k=0
while k<100: # critério de parada alternativo
    k=k+1 # número da iteração
    x=(a+b)/2 # bissecção
    if f(x)*f(a)>0:
        a=x
    else:
        b=x

    # Resultado    
    print (k,"","%0.3f"%a, "< r <","%0.3f"%b)

    # Critério de parada
    if abs (b-a) < 0.01:
        break

#######################################################################################################################################################################
# Método da Posição Falsa

print("")
print("Método da Posição Falsa")

# Chute do intervalo no qual estará a raíz, a < r < b
a = 0
b = 1

# método
k = 0
while True:

    # posição falsa 
    r = (a*f(b)-b*f(a))/(f(b)-f(a)) 
    k = k+1 # número da iteração

    if f(b) < 0 and f(r) < 0:
        b = r
    elif f(a) < 0 and f(r) < 0:
        a = r
    elif f(b) > 0 and f(r) > 0:
        b = r
    elif f(a) > 0 and f(r) > 0:
        a = r
    elif f(a) > 0 and f(b) > 0 and f(r) < 0:
        a = r
    
    # Resultado
    print("{:3d} {} {:.6f} {} {:.6f}".format(k,"r=", r,"f(r)=", f(r)))

    # critério de parada 1
    if abs (f(r)) < epsilon1: 
        break

    # critério de parada 2
    if abs ((a-b)) < epsilon2: 
        break

    # critério de parada 3
    if k > 100:
        print("Excedido o número de iterações")
        break

#######################################################################################################################################################################
# Método do Ponto Fixo

print("")
print("Método do Ponto Fixo ")

# chute inicial
x0 

# não dividir por 0 na função inversa
if x0 == 3 or x0 == -3:
    print ("não definido para x0 = 3 ou -3")
# função inversa 
else:
    r = g(x0)

# método
k = 0
while True:
    # não dividir por 0 de novo
    if x0 == 3 or x0 == -3:
        break

    # posição falsa
    x0 = r
    r = g(x0)

    k = k+1 # número da iteração

    # resultado
    print("{:3d} {} {:.6f} {} {:.6f}".format(k,"r=", r,"f(r)=", f(r)))

    # critério de parada 1
    if abs(f(r)) < epsilon1:
        break

    # critério de parada 2
    if abs((r-x0)) < epsilon2:
        break

    #critério de parada 3
    if k > 100:
        print("Excedido o número de iterações")
        break

#######################################################################################################################################################################
# Método de Newton-Raphson

print("")
print("Método de Newton-Raphson")

# chute inicial
x0

# método
k = 0
r = x0 - (f(x0))/(D_f(x0)) # Newton-Raphson
while True:

    x0 = r
    r = x0 - (f(x0))/(D_f(x0)) # Newton-Raphson
    k = k+1 # número da iteração

    # resultado
    print("{:3d} {} {:.6f} {} {:.6f}".format(k,"r=", r,"f(r)=", f(r)))

    # critério de parada 1
    if abs(f(r)) < epsilon1:
        break

    # critério de parada 2
    if abs((r-x0)) < epsilon2:
        break

    #critério de parada 3
    if k > 100:
        print("Excedido o número de iterações")
        break

#######################################################################################################################################################################
# Método Secante

print("")
print ("Método Secante")

# chute inicial
x0

a = 0 

# método
k = 0
while True:

    r = a - (f(a)*(a-x0))/(f(a)-f(x0)) # Secante
    k= k + 1 # número da iteração

    if f(x0) < 0 and f(r) < 0:
        x0 = r
    elif f(a) < 0 and f(r) < 0:
        a = r
    elif f(x0) > 0 and f(r) > 0:
        x0 = r
    elif f(a) > 0 and f(r) > 0:
        a = r
    elif f(a) > 0 and f(x0) > 0 and f(r) < 0:
        a = r

    # resultado
    print("{:3d} {} {:.6f} {} {:.6f}".format(k,"r=", r,"f(r)=", f(r)))

    # critério de parada 1
    if abs(f(r)) < epsilon1:
        break

    # critério de parada 2
    if abs((r-x0)) < epsilon2:
        break

    #critério de parada 3
    if k > 100:
        print("Excedido o número de iterações")
        break