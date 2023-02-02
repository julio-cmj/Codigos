    # a  
    # tempo de queda sem atrito é igual a h=g/2*t^2 -> t= (h/g)^(1/2), sendo "h" a altura em metros,"t" o tempo em segundos e "g" a gravidade
altura = h = float(input("altura= "))
gravidade = g = 9.8
tempo_de_queda = t = (2*h/g)**(1/2)
print ("tempo de queda igual a", "%.2f" %t, "segundos")

    # b
x = int(input("número inteiro: "))
if x%2 == 0:
    print ("par")
else:
    print ("ímpar")


    # c
    # Q = m*c*ΔT, sendo "Q" energia, "m" a massa, "c" calor específico e "ΔT" a variação de temperatura
massa = m = float(input("massa= "))
calor_especifico = c = 0.5
Tinicial= float(input("temperatura inicial= "))
Tfinal= float(input("temperatura final= "))
ΔT= Tfinal - Tinicial
Q = m*c*ΔT
print ("Energia necessaria= ", "%0.3f" %Q) 


    # d
x= float(input("x= "))
y= float(input("y= "))
if x == y:
    print("iguais")
elif x < y:
    print ("menor")
elif x > y:
    print ("maior")


    # e
    # F = C*1.8 + 32
pergunta= input('Responda "Celsius" para Celsius -> Fahrenheit ou "Fahrenheit" para Fahrenheit -> Celsius')
if pergunta.lower() == "celsius" or "c" or "cesius":
    C = float(input("Temperatura °C= "))
    F = C*1.8 + 32
    print(F,"°F")
elif pergunta.lower() == "fahrenheit" or "f" or "fahreheit" or "farenheit" or "fahreneit" or "fareneit":
    F= float(input("Temperatura °F= "))
    C= (F-32)/1.8
    print (C,"°C")
else:
    print("Resposta invalida")
if C > 40:
    print("Muito quente")
elif C >= 30:
    print("Quente") 
elif C >=15: 
    print("Agradável")
elif C >=5: 
    print("Friozinho")
elif C >=0:
    print("Frio")
elif C >=-10:
    print("Muito frio")
elif C <= 10: 
    print("Congelante")


    # f
resposta = input("score= ")
try:
    score=float(resposta)
    if score> 10 or score <0:
        print ("invalid score")
    elif score >= 9:
        print ("A")
    elif score >= 8:
        print ("B")
    elif score >= 7:
        print ("C")
    elif score >= 6:
        print ("D")
    elif score < 6:
        print ("E")
except:
    print("invalid score")


    #g
    #ax²+bx+c=0
a = float(input("a= "))
b = float(input("b= "))
c = float(input("c= "))
delta = (b**2) - (4*a*c)
if delta >= 0 and a != 0:
    raiz_delta = delta**(1/2)
    raiz1 = (-b-raiz_delta)/(a*2)
    raiz2 = (-b+raiz_delta)/(a*2)
    if raiz1 == -0.0:
        raiz1 = 0
    if raiz2 == -0.0:
        raiz2 = 0 
    print(raiz1,"ou",raiz2)
elif delta < 0:
    print("raíz fora do conjunto dos reais")
elif a == 0:
    print("não é função quadratica")


    #3
Horas = input("Jornada? ")
Salario =input("Salario? ")
try:
    salario=float(Salario) 
    horas=float(Horas)
    JornadaBase= 40
    SalarioBase= JornadaBase*salario
    if horas > JornadaBase:
        valor = ((horas-JornadaBase) * (salario*1.5) + SalarioBase)
    elif horas == JornadaBase:
        valor = (SalarioBase)
    elif horas < JornadaBase:
        valor = (SalarioBase - (JornadaBase-horas) * (salario))
    print (valor,'R$')
except:
    print("Resposta inserida não numerica")
