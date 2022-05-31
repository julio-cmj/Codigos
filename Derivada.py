#f= x**3
def f(x):
    y=x**3
    return y

def Da_f(x):
    y=3*x**2
    return y

a=0
b=3
intervalo=[a,b]
f=1
for n in intervalo:
    f1=f
    f=(n**3)-(9*n)+5
    print (f)
    f1f2=f1*f
    print(f1f2)

def f(x):
    y=x**3
    return y

def Db_f(x,Δx):
    y =( f(x+Δx) - f(x) ) / Δx

    return y

intervalo= [0.01,0.5,1,1.5,2]
for n in intervalo:
    a= Da_f(n)
    b= Db_f(n,0.00001)
    print ('x=',n,'  valor A =',a,' valor B = ',b, 'Erro = %.4f' %(a/b*100),'\n' )