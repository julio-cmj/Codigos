
x = [20,25,30,35,40,45,50]
y = [0.99907,0.99852,0.99826,0.99818,0.99828,0.99849,0.99878]

m=len(x)
dely=[]
for i in range(0,m):
    dely.append(y[i])


for k in range(1,m):
    for i in range(m,k,-1):
        dely[i-1] = (dely[i-1]-dely[i-2])/(x[i-1]-x[i-k-1])

r=dely[m-1]
z = 32.5


for i in range(m-1,0,-1):
    r = r*(z-x[i-1])+dely[i-1]


print ("O calor específico da água a 32.5 °C é","%f" %r)


#----------------------------------------------------------------------------------------------------------------------------------------------------------------------------


x = [20,25,30,35,40,45,50]
y = [0.99907,0.99852,0.99826,0.99818,0.99828,0.99849,0.99878]

m=len(x)
dely=[]
for i in range(0,m):
    dely.append(y[i])


for k in range(1,m):
    for i in range(m,k,-1):
        dely[i-1] = (dely[i-1]-dely[i-2])/(x[i-1]-x[i-k-1])

r=dely[m-1]
z = 20
o = []

while z<50:
    r=dely[m-1]
    for i in range(m-1,0,-1):
        r = r*(z-x[i-1])+dely[i-1]
    if round(r,5) == 0.998370:
        o.append("%.1f"%z)
    z = z + 0.1

print ("A temperatura para a qual o calor específico é 0.99837 está entre",o[0],"-",o[1],'°C',"ou",o[2],"-",o[3],"°C")
    

