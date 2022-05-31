import numpy as np

# Valores tabelados
x = []
y = []

# Quantidade de g(x)  n_g = quantidade de g(x)
n_g = input('Quantidade de "g(x)" na fórmula''\n') #Exemplo g1(x) = x**2  g2(x) = x  então há dois g(x)
n_g = int(n_g)

# Criar lista com a equação de cada g(x) 
g_x = []
for i in range (0,n_g):
    g_x.append(input("g(x)= "))  # A variavel deve ser x. Exemplo digitar y**2 ou X**2, neste caso digite x**2
an = len(g_x)
#print (g_x)

# Valores de a
a = []
for k in range(0,n_g):
    g = lambda x: eval(g_x[k])
    for v in range(0,n_g):
        f = lambda x:eval(g_x[v])
        g1 = []
        for i in (x):
            s = g(i)*f(i)
            g1.append (s)
        a.append(sum(g1))


# Valores de b
b=[]
for k in range (0,n_g):
    g2 = []
    g = lambda x: eval(g_x[k])
    for i,j in zip(x,y):
        s = j * g(i)
        g2.append(s)
    b.append(sum(g2))

#print (a)
#print (b)

# Matriz dos termos b
B = "np.array (["
for i in range(0,len(b)):
    B = B + str(b[i])
    if i == len(b)-1:
        break
    else:
        B = B + ","
B = B + "])"

# Matriz dos termos a
A = "np.array ([["
for i in range(0,len(a)):
    A = A + str(a[i])
    if (i+1) == len(a):
        break
    elif (i+1)%len(b) == 0:
        A = A + "]"
        A = A + ",[" 
    else:
        A = A + ","
A = A + "]])"

print (A)
print (B)

# Resolver o sistema de equações
A = eval(A)
B = eval(B)
X = np.linalg.solve(A,B)
print (X)  # Em ordem [α1 α2 ... αn]