%matrizes de pauli
pauli_x=[0 1 ; 1 0];
pauli_y=[0 -1i ; 1i 0];
pauli_z=[1 0 ; 0 -1];

%kets
ket_0=[1;0];
ket_1=[0;1];
ket_00=kron(ket_0,ket_0);
ket_01=kron(ket_0,ket_1);
ket_10=kron(ket_1,ket_0);
ket_11=kron(ket_1,ket_1);

%Portas lógicas
um=[1 0 ; 0 1];
Had=[1 1 ;1 -1]/sqrt(2);
CHad=[1 0 0 0; 0 1 0 0; 0 0 1/sqrt(2) 1/sqrt(2); 0 0 1/sqrt(2) -1/sqrt(2)];
CNOT=[1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0];
S=[1 0; 0 1i];
Z = [1 0; 0 -1];
NOT = [0 1; 1 0];
Sa = kron(um, S);
pauli_zA = kron(um, pauli_z);
HadA=kron(Had,um);
HadB=kron(um,Had);

%Matrizes densidade
den_0 = ket_0*(ket_0)';
den_1 = ket_1*(ket_1)';
den_00 = ket_00*(ket_00)';
den_01 = ket_01*(ket_01)';
den_10 = ket_10*(ket_10)';
den_11 = ket_11*(ket_11)';

%showmat(1, den_00);
%showmat(2, den_01);
%showmat(3, den_10);
%showmat(4, den_11);

%Chamando a função de rotação
r = R_alpha(pi, pauli_x);
[vec, lambda]=eig(pauli_x);
av1=vec(:,1);                   %ket do primeiro autovetor

%Estados de Bell
Bell_1=CNOT*kron(Had*ket_0,ket_0);
Bell_2=CNOT*kron(Had*(pauli_x*ket_0), ket_0);
Bell_3=CNOT*kron(Had*ket_0, pauli_x*ket_0);
Bell_4=CNOT*kron(Had*(pauli_x*ket_0),pauli_x*ket_0);

%Estados dia 2

estado_1 = (kron(um,S))*(CNOT*(kron(Had*ket_0,ket_0)));
estado_2 = kron((Had*ket_0),(Had*ket_0));
estado_3 = HadA*CNOT*(kron(Had*ket_0,pauli_x*ket_0));
estado_4 = Sa*pauli_zA*CHad*kron(Had*(pauli_x*ket_0), ket_0);

%Escrevendo as portas lógicas em função da rotação
HadR = 1i*(R_alpha(pi,pauli_x)*R_alpha(pi/2, pauli_y));
X_Rot = 1i*R_alpha(pi, pauli_x);
Y_Rot = 1i*R_alpha(pi, pauli_y);
Z_Rot = 1i*R_alpha(pi/2, pauli_x)*R_alpha(pi, pauli_y)*R_alpha(-pi/2, pauli_x);

% r = @(theta,dir) expm(-1i*theta*dir/2);

R_Z = @(theta) 1i*R_alpha(pi/2, pauli_x)*R_alpha(theta, pauli_y)*R_alpha(-pi/2, pauli_x);

RZ=R_Z(pi);

evol_1_2J = expm(-1i*pi*kron(pauli_z,pauli_z)/4);

linha_1 = kron(um, R_alpha(-pi/2, pauli_x))*kron(um, R_alpha(pi/2, pauli_y))*kron(um, R_alpha(pi/2, pauli_x));
linha_2 = kron(R_alpha(-pi/2, pauli_x), um)*kron(R_alpha(-pi/2, pauli_y), um)*kron(R_alpha(pi/2, pauli_x), um);
linha_3 = kron(um, R_alpha(pi/2, pauli_x))*(evol_1_2J)*kron(um, R_alpha(pi/2,pauli_y));

CNOTab_R = (linha_1*linha_2*linha_3);

theta = pi/2; phi = pi/2;

[cos(theta/2) exp(-1i * phi) * sin(theta/2); exp(1i * phi) * sin(theta/2) -cos(theta/2)];

omega = (2*pi*215.18)/4;
O = kron(pauli_x,pauli_y)+kron(pauli_y, pauli_x);
%O_inicial=expm((-1i*omega*Delta_t)*kron(pauli_z,pauli_z));


%A = kron(pauli_x,pauli_y);
%O_f=kron((R_alpha(pi/2,pauli_y)*pauli_z), (R_alpha(pi/2,pauli_x)*pauli_z));


Comutador=(kron(pauli_x,pauli_y)*kron(pauli_y,pauli_x)-kron(pauli_y,pauli_x)*kron(pauli_x,pauli_y));

U_op1=kron(R_alpha(pi/2,pauli_y),R_alpha(-pi/2,pauli_x));
U_op2=kron(R_alpha(-pi/2,pauli_x),R_alpha(pi/2,pauli_y));

%Rot_H = (U_op1*O_inicial*(U_op1)')*(U_op2*O_inicial*(U_op2)');


[vec, lambda] = eig(omega*(kron(pauli_x,pauli_y)+kron(pauli_y,pauli_x)));

v1=vec(:,1);




for K = 1:1:10
Delta_t = (K-1)*(1/(2*215.18));
t(K) = Delta_t;
O_inicial=expm((-1i*omega*Delta_t)*kron(pauli_z,pauli_z));
expon= expm((-1i*omega*Delta_t)*(kron(pauli_x,pauli_y)+kron(pauli_y,pauli_x)))*ket_00;
Rot_H00 = (U_op1*O_inicial*(U_op1)')*(U_op2*O_inicial*(U_op2)')*ket_00; %hamiltoniano final aplicado no estado 00
den_Rot00 = Rot_H00*(Rot_H00)';
den_expon = expon*expon';
f(K) = fidelmat(den_expon, den_Rot00);


G{K} = [den_Rot00];
%showmat(K, G{K})

end




% Hamiltoniano adiabático
omega0 = 1;
J = 215.18;

H_0 = (kron(pauli_x, um)+kron(um, pauli_x));
H_f = 0.5*kron(pauli_z, um) + 0.25*kron(um, pauli_z) + kron(pauli_z, pauli_z);
Fund_H0 = kron(NOT,Z)*kron(Had*(NOT*ket_0), Had*ket_0);
%H_0Rot = kron(R_alpha(, pauli_x), um)*kron(um, R_alpha(, pauli_x))
%H_f = a*kron(R_alpha(2*omega1, pauli_z), um)*b*kron(um, R_alpha(2*omega1, pauli_z))*J*expm((-1i*omega1)*kron(pauli_z,pauli_z))


[vec, lambda] = eig(H_0);
[vec1, lambda1] = eig(H_f)

%U = expm(-1i*(kron(pauli_x, um) + kron(um, pauli_x))*0.5)
%test = kron(expm(-1i*pauli_x*0.5), expm(-1i*pauli_x*0.5))

%U = expm(-1i*(3*kron(pauli_z, um) + 2*kron(um, pauli_z) + kron(pauli_z, pauli_z))*0.5)
%test = kron(expm(-1i*3*pauli_z*0.5), expm(-1i*2*pauli_z*0.5))*expm(-1i*0.5*kron(pauli_z, pauli_z))

%O_t=expm((-1i*0.25)*kron(pauli_z,pauli_z))
%test = kron(expm(-1i*0.25*pauli_z), expm(-1i*0.25*pauli_z))

H_ad=Fund_H0;
T = 50000;

for t = 0:1:T
gamma = t/T;
Deltat = 0.05;

theta1 = (1-gamma)*Deltat;
theta2 = (gamma)*0.5*Deltat*2;
theta3 = (gamma)*0.25*Deltat*2;

primeira = kron(R_alpha(theta1, pauli_x), R_alpha(theta1, pauli_x));
segunda = kron(R_alpha(theta2, pauli_z), R_alpha(theta3, pauli_z));
O_nat=expm(-1i*Deltat*((gamma))*kron(pauli_z,pauli_z));

H_ad = primeira*segunda*O_nat*primeira*H_ad;

end



