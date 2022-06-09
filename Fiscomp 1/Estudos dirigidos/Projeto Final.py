import math
# Numero de forças
n_forças = input("Qual a quantidade de forças?\n")

while True:
    try:
        float_Nf = float(n_forças)
    except:
        print("Digite a quantidade de forças apenas com números naturais")
        n_forças = input("Qual a quantidade de forças?\n")
        continue

    if float_Nf - int(float_Nf) == 0 and float_Nf > 0:
        n_forças = int(float_Nf)
        break
    else:
        print("Digite a quantidade de forças apenas com números naturais")
        n_forças = input("Qual a quantidade de forças?\n")
        continue

# transformar o numero de forças em lista
n_forças = int(n_forças)
variavel_controle1 = n_forças
n_forças = list(range(1, n_forças+1))

# valor de cada força
v_forças = input("Digite o módulo de cada força\n").split()
while True:
    try:
        variavel_controle2 = 0
        for n in v_forças:
            n = float(n)
            variavel_controle2 = variavel_controle2 + 1
            if n < 0:
                print("Digite o módulo em módulo")
                v_forças = input("Digite o módulo de cada força\n").split()
                continue

    except:
        print("Digite somente com números")
        print("Em caso de número decimal use ponto ao invés de vírgula")
        v_forças = input("Digite o módulo de cada força\n").split()
        continue
    if variavel_controle1 == variavel_controle2:
        break
    else:
        print("Quantidade de módulos diferente da quantidade de forças")
        print("Em caso de número decimal use ponto ao invés de vírgula")
        v_forças = input("Digite o módulo de cada força\n").split()
        continue


# relacionar o numero de forças a uma variavel e ao seu valor
for n in n_forças:
    globals()['força%s' % n] = v_forças.pop(0)

# angulo de cada força
a_forças = input("Digite o ângulo de cada força com o eixo X em graus\n").split()

while True:
    try:
        variavel_controle3 = 0
        for n in a_forças:
            float(n)
            variavel_controle3 = variavel_controle3 + 1
    except:
        print("Digite somente com números")
        a_forças = input("Digite o ângulo de cada força com o eixo X\n").split()
        continue

    if variavel_controle1 == variavel_controle3:
        break
    elif variavel_controle1 != variavel_controle3:
        print("Quantidade de ângulos diferente da quantidade de forças")
        a_forças = input("Digite o ângulo de cada força com o eixo X\n").split()
        continue

# transformar os angulos em graus para radianos
for a in range(len(a_forças)):
    a_forças[a] = int(a_forças[a])
a_forças = [angulo * (math.pi/180) for angulo in a_forças]
a2_forças = list(a_forças)

# Obter o valor de cada força com eixo X = modulo * cosseno
L = dir()

for name in L:
    if name.startswith("força"):
        try:
            globals()['anguloX_%s' % name] = (int(eval(name))*math.cos(a_forças.pop(0)))
        except:
            pass

# Obter o valor da força no eixo Y = modulo * seno
for name in L:
    if name.startswith("força"):
        try:
            globals()['anguloY_%s' % name] = (int(eval(name))*math.sin(a2_forças.pop(0)))
        except:
            pass

# Resultante no eixo Y e no eixo X
L = dir()
soma_x = 0
for name in L:
    if name.startswith("anguloX"):
        soma_x = soma_x + eval(name)

soma_y = 0
for name in L:
    if name.startswith('anguloY'):
        soma_y = soma_y + eval(name)

print("A resultante no eixo X é", '%0.4f' % soma_x)
print('A resultante no eixo Y é', '%0.4f' % soma_y)

# Calcular a força resultante

soma_x_modulo, soma_y_modulo = '%0.4f' % math.copysign(soma_x, 1), '%0.4f' % math.copysign(soma_y, 1)

if soma_x_modulo == '0.0000' and soma_y_modulo == '0.0000':
    print("A força resultante é nula")
elif soma_x_modulo == '0.0000' and soma_y_modulo != '0.0000':
    a_resultante = math.pi/2
    a_resultante_graus = (180/math.pi) * a_resultante
    v_resulante = soma_x / math.cos(a_resultante)
    print("O valor da força resultante é", '%0.4f' % v_resulante,
          "e seu ângulo com o eixo X é", '%0.2f' % a_resultante_graus, "graus")
else:
    a_resultante = math.atan(soma_y/soma_x)
    a_resultante_graus = (180/math.pi) * a_resultante
    v_resulante = soma_x / math.cos(a_resultante)
    print("O valor da força resultante é", '%0.4f' % v_resulante,
          "e seu ângulo com o eixo X é", '%0.2f' % a_resultante_graus, "graus")
