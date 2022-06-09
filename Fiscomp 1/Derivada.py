# Cálculo da derivada de uma função

# função, f(x)
def f(x):
    y = x**3 # y = x³
    return y

# função derivada, f'(x)  # Δx tende a 0
def Db_f(x,Δx):
    y =( f(x+Δx) - f(x) ) / Δx
    return y

# exemplo, f'(2) = 12
print (Db_f(2,0.00000001))