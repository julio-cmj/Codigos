
clear all;

%--------------------------------------------------------------------------

s1 = [1 0; 0 1];

sx = [0 1; 1 0];

sy = [0 -1i; 1i 0];

sz = [1 0; 0 -1];


ap = [0 0; 1 0];

am = [0 1; 0 0];


sm = sx - 1i * sy;


sp = sx + 1i * sy;

%--------------------------------------------------------------------------


G = 3;

J = -1;


H_final = J * kron(sz, sz) - 0.5 * kron(sz, s1) - 0.0125 * kron(s1, sz); 


H_inicial =  - G * (kron(sx, s1) + kron(s1, sx));


%--------------------------------------------------------------------------


[vet, val] = eig(H_final)


ket_alv = vet(:, 1);


rho_alv = ket_alv * ket_alv';


[vet, val] = eig(H_inicial)


ket_ini = vet(:, 1);


rho_ini = ket_ini * ket_ini'; 


% ket_ini = [0.9 -0.7 -0.5 0.6]'; 


% rho_ini = ket_ini * ket_ini'; 


%--------------------------------------------------------------------------

dt = 0.1;

%--------------------------------------------------------------------------


n = 1;

Np = 300;

rho_t = rho_ini; 

%----------------------------- plots --------------------------------------

figure(1);


subplot(2,2,1);

bar3(real(rho_t));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,2);

bar3(imag(rho_t));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,3);

bar3(real(rho_alv));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,4);

bar3(imag(rho_alv));

axis off;

axis([0 5 0 5 -1 1]);


drawnow;

%--------------------------------------------------------------------------


for t = 0:1:Np;
    
    
    % fff = -t/Np + 1;
    
     fff = (tanh(3*t * dt - 1) + 1) / 2;
    
    
    fff = 1 * (cos( pi * t / Np) + 1) / 2;

    
    H_i = fff * H_inicial; 
    
   
    H_f = (1 - fff) * H_final; 

    
    U = expm(-1i * H_f * dt / 2) * expm(-1i * H_i * dt) * expm(-1i * H_f * dt / 2);
    
    
    rho_t = U * rho_t * U';
    
   
    

%--------------------------------------------------------------------------    
    
   [vet, val] = eig(H_i + H_f); erg(:, n) = diag(val);

   k(n) = n; 

%--------------------------------------------------------------------------    

   ggg(n) = fff; 

%--------------------------------------------------------------------------

   n = n + 1;
   
end;

figure(2);

plot(k, erg(1,:), '-ro', k, erg(2,:), '-y*', k, erg(3,:), '-gs', k, erg(4,:), '-b.')


%----------------------------- plots --------------------------------------

figure(3);


subplot(2,2,1);

bar3(real(rho_t));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,2);

bar3(imag(rho_t));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,3);

bar3(real(rho_alv));

axis off;

axis([0 5 0 5 -1 1]);


subplot(2,2,4);

bar3(imag(rho_alv));

axis off;

axis([0 5 0 5 -1 1]);


drawnow;


