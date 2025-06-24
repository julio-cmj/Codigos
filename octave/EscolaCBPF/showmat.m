function showmat(fnun,roh);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
%Alexandre Souza CBPF
%
%function showmat(fnum,roh);
%Plota Matriz em barras
%fnum = numero da figura
%roh -> matriz
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(fnun)

n = length(roh);

aux = [max(abs(real(roh))) max(abs(imag(roh)))];

aux2 = [0 n+1 0 n+1 -max(aux) max(aux)];

subplot(121);

bar3(real(roh));

axis(aux2);

axis off;

subplot(122);

bar3(imag(roh));

axis(aux2);

axis off;

colormap('winter')
