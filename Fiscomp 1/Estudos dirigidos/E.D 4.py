#x³-9x+5 0,58 2,67
import math
def f(x):
    y=(x**3)-(9*x)+5
    return y

a=0
b=3
x=(a+b)/2
while True:
    if f(b)<0 and f(x)<0:
        b=x
    elif f(a)<0 and f(x)<0:
        a=x
    elif f(b)>0 and f(x)>0:
        b=x
    elif f(a)>0 and f(x)>0:
        a=x
    elif f(a)>0 and f(b)>0 and f(x)<0:
        a=x
    x=(a+b)/2
    if math.copysign(f(x),1) < 0.02:
        intervalo=['%0.5s'%a,'%0.5s'%b]
        print (intervalo)
        break

a=0
b=3
x=(a+b)/2
while True:
    if f(b)<0 and f(x)<0:
        b=x
    elif f(a)<0 and f(x)<0:
        a=x
    elif f(b)>0 and f(x)>0:
        b=x
    elif f(a)>0 and f(x)>0:
        a=x
    elif f(a)>0 and f(b)>0 and f(x)<0:
        b=x
    x=(a+b)/2
    if math.copysign(f(x),1) < 0.02:
        intervalo=['%0.5s'%a,'%0.5s'%b]
        print (intervalo)
        break