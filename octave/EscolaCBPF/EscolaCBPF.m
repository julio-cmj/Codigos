clear;clc;
#kron - produto tensorial
#ket' - hermitiano do ket
#expm - exponencial com matriz
#[vec, lambda] eig() - autovalores e autovetores

# qubits
ket_0 = [1;0];
ket_1 = [0;1];

# kets de dois qubits
ket_00 = kron(ket_0, ket_0);
ket_10 = kron(ket_1, ket_0);
ket_01 = kron(ket_0, ket_1);
ket_11 = kron(ket_1, ket_1);

# matrizes de pauli
sigma_x = [0 1 ; 1 0];
sigma_y = [0 -i; i 0];
sigma_z = [1 0 ; 0 -1];
um = [1 0; 0 1];

# Hamiltoniano RMN
J = 215.5;
H_zz =  pi/2 * J * kron(sigma_z, sigma_z); #

# portas logicas
H = 2^-(1/2) * [1 1; 1 -1];
Cnot1 = [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0];   # bit 1 controle
Cnot2 = [1 0 0 0; 0 1 0 1; 0 0 1 0; 0 1 0 0];   # bit 2 controle
S = [1 0; 0 i];

# portas logicas 2
Oh_1 = kron(H, um);
Oh_2 = kron(um, H);
Ox_1 = kron(sigma_x, um);
Ox_2 = kron(um, sigma_x);
Oy_1 = kron(sigma_y, um);
Oy_2 = kron(um, sigma_y);
Oz_1 = kron(sigma_z, um);
Oz_2 = kron(um, sigma_z);
Os_1 = kron(S, um);
Os_2 = kron(um, S);

# portas em forma de rotação
Rx = rotacao(pi, sigma_x);
Ry = rotacao(pi, sigma_y);
Rz = rotacao(pi/2, sigma_x) * rotacao(pi,sigma_y) * rotacao(pi, -sigma_x);
Rs = rotacao(pi/2, sigma_x) * rotacao(pi/2,sigma_y) * rotacao(pi, -sigma_x);
Rt = rotacao(pi/2, sigma_x) * rotacao(pi/4,sigma_y) * rotacao(pi, -sigma_x);
Rh = rotacao(pi,sigma_x) * rotacao(pi/2, sigma_y);
Rcnot1 = kron(rotacaoz(pi/2), um) * kron(um, rotacaoz(-pi/2)) * kron(um, rotacao(pi/2, sigma_x)) * evolucao(1/(2*J), H_zz) * kron(um, rotacao(pi/2, sigma_y));
Rcnot2 = kron(um, rotacaoz(pi/2)) * kron(rotacaoz(-pi/2), um) * kron(rotacao(pi/2, sigma_x), um) * evolucao(1/(2*J), H_zz) * kron(rotacao(pi/2, sigma_y), um);

# Tarefas

% estados de bell
#|00> + |11> = Cnot * Oh_1 * ket_00
#|00> - |11> = Oz_1 * Cnot * Oh_1 * ket_00
#|01> + |10> = Cnot * Ox_2 * Oh_1 * ket_00
#|01> - |10> = Oz_1 * Cnot * Ox_2 * Oh_1 * ket_00

% outros estados
#|00> + i|11> = Os_1 * Cnot * Oh_1 * ket_00
#1/2 |00> + |01> + |10> + |11> = Oh_1 * Oh_2 * ket_00
#1/2 |00> + |01> - |10> + |11> = Oh_1 * Cnot * Ox_2 * Oh_1 * ket_00
#1/2 |00> - 1/4 |10> + i/4 |11> = Ox_1 * Oh_1 Ch * Oz_2 * Os_2 * ket_00

# Hamiltoniando RF
#H_rf = pi/2 * J * (kron(sigma_x, sigma_y) + kron(sigma_y, sigma_x)); #

# Evolução hamiltoniano
#n = 0;
#fid = [];
#for t = 1:0.1:10;
#  n = n + 1;
#  estado = ket_00;
#  Uteo = expm(-i * H_rf * t);
#  U_xy = kron(rotacao(-pi/2, sigma_x), rotacao(pi/2, sigma_y)) * expm(-i * H_zz * t) * kron(rotacao(pi/2, sigma_x'), rotacao(-pi/2, sigma_y'));
#  U_yx = kron(rotacao(pi/2, sigma_y), rotacao(-pi/2, sigma_x)) * expm(-i * H_zz * t) * kron(rotacao(-pi/2, sigma_y'), rotacao(pi/2, sigma_x'));
#  Uexp = U_xy * U_yx;
#  P1 = (Uteo*estado)*(Uteo*estado)';
#  P2 = (Uexp*estado)*(Uexp*estado)';
#  fid = [fid, trace(P1 * P2) / sqrtm(trace(P1^2) * trace(P2^2))];
#end
#plot(fid)

# Hamiltoniano XYZ
#H_xyz = J * pi/2 * (kron(sigma_x,sigma_x) + kron(sigma_y,sigma_y) + kron(sigma_z,sigma_z));
#U_xx = kron(rotacao(pi/2, sigma_x), rotacao(pi/2, sigma_x)) * expm(-i * H_zz) * kron(rotacao(-pi/2, sigma_x'), rotacao(-pi/2, sigma_x'));
#U_yy = kron(rotacao(pi/2, sigma_y), rotacao(pi/2, sigma_y)) * expm(-i * H_zz) * kron(rotacao(-pi/2, sigma_y'), rotacao(-pi/2, sigma_y'));
#H_xx_yy_zz = U_yy * U_xx * expm(-i * H_zz)

# Hamiltoniano Adiabatico
fixed_point_format(6);
H_ad=1/2 * (ket_00 + ket_01 + ket_10 + ket_11);
T = 100;
fid = [];

for t = 0:1:T
gamma = t/T;
Deltat = 0.5;

theta1 = (1-gamma)*Deltat;
theta2 = (gamma)*0.5*Deltat*2;
theta3 = (gamma)*0.25*Deltat*2;

primeira = kron(rotacao(theta1, sigma_x), rotacao(theta1, sigma_x));
segunda =  kron(rotacao(theta2, sigma_z), rotacao(theta3, sigma_z));
O_nat=expm(-i*Deltat*gamma*kron(sigma_z,sigma_z));

H_ad = primeira*segunda*O_nat*primeira*H_ad;
P1 = H_ad*H_ad';
P2 = ket_00*ket_00';
fid = [fid, trace(P1 * P2) / sqrtm(trace(P1^2) * trace(P2^2))];
end

figure(1);
plot(fid);

lambda = 0.5;
w0 = 1;
wa = 0.25;
wb = 0.5;
wj = 1;
t = 10;

H0 = w0 * ( kron(sigma_x,um) + kron(um, sigma_x) );
Hf = wa * kron(sigma_z, um) + wb * kron(um, sigma_z) + wj * kron(sigma_z,sigma_z);

expm(-i * ( (1-lambda) * H0 + lambda * Hf) * t);
expm(-i * (1-lambda) * H0 * t/2) * expm(-i * lambda* Hf * t) * expm(-i * (1-lambda) * H0 * t/2);


fid = []
for t = 0:1:T
gamma = t/T;
Deltat = 0.5;

H_ad = expm(-i * (1-gamma) * H0 * Deltat/2) * expm(-i * gamma* Hf * Deltat) * expm(-i * (1-gamma) * H0 * Deltat/2) * H_ad;
P1 = H_ad*H_ad';
P2 = ket_00*ket_00';
fid = [fid, trace(P1 * P2) / sqrtm(trace(P1^2) * trace(P2^2))];
end

figure(2)
plot(fid)
