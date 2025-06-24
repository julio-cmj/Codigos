#Teleporte, Alice para Bob
clear;
# kets 1 qubit
ket_0 = [1;0];
ket_1 = [0;1];

# kets 2 qubits
ket_00 = kron(ket_0, ket_0);
ket_10 = kron(ket_1, ket_0);
ket_01 = kron(ket_0, ket_1);
ket_11 = kron(ket_1, ket_1);
bell_00 = (ket_00+ket_11)/sqrt(2);

# kets 3 qubits
ket_000 = kron(ket_0,ket_00);
ket_001 = kron(ket_0,ket_01);
ket_010 = kron(ket_0,ket_10);
ket_011 = kron(ket_0,ket_11);
ket_100 = kron(ket_1,ket_00);
ket_101 = kron(ket_1,ket_01);
ket_110 = kron(ket_1,ket_10);
ket_111 = kron(ket_1,ket_11);

# estado teleportado
alpha = rand();
psi = sqrt(alpha)*ket_0 + sqrt(1-alpha)*ket_1;

# estado inicial
psi_0 = kron(psi,bell_00); # estado de bell_00

# matrizes pauli
sigma_x = [0 1 ; 1 0];
sigma_y = [0 -i; i 0];
sigma_z = [1 0 ; 0 -1];
um = [1 0; 0 1];

# portas
H = 2^-(1/2) * [1 1; 1 -1];
Cnot1 = [1 0 0 0; 0 1 0 0; 0 0 0 1; 0 0 1 0];   # bit 1 controle

# Operadores de projeção
Proj_0 = ket_0*ket_0';
Proj_1 = ket_1*ket_1';

# Algoritmo

# Aplica Cnot do primeiro qubit no segundo
psi_1 = kron(Cnot1, um)*psi_0;

# Aplica hadamard no primeiro qubit
psi_2 = kron(H, um, um)*psi_1;

# Medição dos dois primeiros qubits

# Probabilidade do primeiro qubit estar no estado 0
alpha1 = psi_2'*kron(Proj_0, um, um)*psi_2;
# Probabilidade do segundo qubit estar no estado 0
alpha2 = psi_2'*kron(um, Proj_0, um)*psi_2;

if alpha1 >= rand();
  qubit_1 = ket_0;
else;
  qubit_1 = ket_1;
endif

if alpha2 >= rand();
  qubit_2 = ket_0;
else;
  qubit_2 = ket_1;
endif

# Ajuste do terceiro qubit/comunicação clássica
psi_A = kron(qubit_1, qubit_2); # qubits de Alice

if psi_A == ket_00;
  psi_3 = psi_2;
elseif psi_A == ket_01;
  psi_3 = kron(um, um, sigma_z)*psi_2;
elseif psi_A == ket_10;
  psi_3 = kron(um, um, sigma_x)*psi_2;
elseif psi_A == ket_11;
  psi_3 = kron(um, um, sigma_z)*kron(um, um, sigma_x)*psi_2;
endif

# Medição do terceiro qubit;
alpha3 = psi_3'*kron(um, um, Proj_0)*psi_3;
beta3 = psi_3'*kron(um, um, Proj_1)*psi_3;

qubit_3 = sqrt(alpha3)*ket_0 + sqrt(beta3)*ket_1
psi
