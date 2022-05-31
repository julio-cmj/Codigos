#energia de ligação
# B = [Z*Mp + (A-Z)*Mn - Mnucleo] * c²
#Mnucleo = A . Mu + delta/c² ou M_atomica * Mu


Mu = 1.660539e-27
Mp = 1.6726e-27
Mn = 1.6749e-27
c = 2.998e+8
#Kev_joule = 1.60218e-16
#delta = 2424.91561 * Kev_joule
Z = [2,6,6,8]
A = [4,12,13,16]
M_atomica = [4.0026032541 , 12 , 13.00335483521 , 15.99491461960]



while True:
    #M_nucleo = (x * Mu) + (delta/(c ** 2))
    M_nucleo = M_atomica[0] * Mu

    B = ((Z[0]*Mp) + ((A[0]-Z[0])*Mn) - (M_nucleo)) * (c ** 2) #Mev
    B = B * 6.242e+12 #Joules
    print (B/A[0])

    A.pop(0)
    Z.pop(0)
    M_atomica.pop(0)

    if A == []:
        break