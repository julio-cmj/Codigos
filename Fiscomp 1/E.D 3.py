# 1
valor = v_vericação = 100
total_notas = 0


def verificador(x):
    global v_vericação
    global total_notas
    if v_vericação >= x:
        y = v_vericação/x
        notas = int(y)
        v_vericação = v_vericação-(notas*x)
    elif v_vericação <= x:
        notas = 0
    total_notas = notas + total_notas


def contador(x):
    global valor
    if valor >= x:
        y = valor/x
        notas = int(y)
        valor = valor-(notas*x)
        print(notas, "notas de R$", x)
    elif valor <= x:
        print("0 notas de R$", x)
        notas = 0


verificador(200)
verificador(100)
verificador(50)
verificador(20)

if total_notas == 0 or v_vericação != 0:
    print("Não disponível nesse valor")

else:
    contador(200)
    contador(100)
    contador(50)
    contador(20)


# 2
# f(x)= A*X**2 + B*X + C
A = 2
B = 2
C = 2


def D_f(x):
    D = 2*A*x+B
    print(D)


# 3
primeiro = float(input())
resto = float(input()), float(input()), float(input()), float(input())
maior = primeiro
for numero in resto:
    if numero > maior:
        maior = numero
print("maior=", maior)

menor = primeiro
for numero in resto:
    if numero < menor:
        menor = numero
print("menor=", menor)

#4-a
def soma(a,b):
    c= a+b
    return c
print (soma(2,3))
print (soma(10,11))
print (soma (-1,1))

#4-b
def velMedia(x,t):
    c= x/t
    return c
print("A velocidade média é: %.2f m/s"%velMedia(10.1, 5))
print("A velocidade média é: {:.2f} m/s".format(velMedia(10.2, 6)))

# 5
n = 0
S_posterior = 0
while n < 10:
    n = n+1
    S_anterior = S_posterior
    S_posterior = 1/n
    S = S_posterior+S_anterior
    S_posterior = S
print(S)


# 6-a
def D_2pontos(x1, y1, x2, y2):
    print("D_x=", x2-x1, "D_y+", y2-y1)

# 6-b


def par_impar(n):
    if n % 2 == 0:
        print('par')
    else:
        print('impar')

# 6-c


def distancia(v, t):
    D = v*t
    print(D)
    return D

# 6-d


def L_horizontal(v):
    H_max = (v**2)/(2*9.8)
    D_total = 2*H_max
    print('Altura Máxima=', '%0.2f' % H_max, 'metros,',
          'Distância Total=', '%0.2f' % D_total, 'metros')

# 6-e


def produto_escalar(x1, y1, z1, x2, y2, z2):
    r = (x1*x2)+(y1*y2)+(z1*z2)
    print(r)
    return r

# 7- y2 não é parametro na função, distX e distY não são variaveis pois apresenta ==


# 8
m = 10


def energia_cinética(v):
    Ec = (m*v**2)/2
    return Ec


def energia_gravitacional(h):
    if h >= 0:
        Eg = m*9.8*h
    else:
        Eg = 0
    return Eg


Ec = energia_cinética(4)
Eg = energia_gravitacional(5)
Em = Ec + Eg
print("Energia Gravitacional=", Eg, "J")
print("Energia Cinética=", Ec, "J")
print("Energia Mecânica=", Em, "J")
