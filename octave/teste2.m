clear;
% Simulação de spin echo - Método de matriz
#######################################################################################################################################
% Definição dos parametros
B1 = 587 * 10^-6; B0 = 11.7;          % Campos magnéticos B0 e B1 - Tesla
Y = 267.255*10^6;                     % Constante giromagnética -  rad/seg * Tesla
T1 = 0.006; T2 = 0.004;                   % Tempos de relaxação T1 e T2 - segundo
pw90 = 10*10^-6;                      % Tempo de rotação de 90 graus - segundos
w = Y*B0;                             % Frequência de ressonância - rad/seg
M0 = [0; 0; 1];                       % Magnetização inicial
#########################################################################################################################################
% Distruibuição da hinomogêneidade do campo mangético
#Gausiana = @(x) exp(-0.5.*(x-25).^2/(50)^2);
Lorentziana = @(x) 1./( 1 + ((x - 25).^2).*(2*pi*0.02).^2);

% Hz
pontos = [-100:1:100];
##########################################################################################################################################
% Definição das matrizes - solução da diferencial

% Matrizes de rotação
% Pulso em x - phi = 0
Rx = @(theta) [1 0 0; 0 cos(theta) sin(theta); 0 -sin(theta) cos(theta)];
% Pulso em y - phi = pi/2
Ry = @(theta) [cos(theta) 0 -sin(theta); 0 1 0; sin(theta) 0 cos(theta)];;

% Matrizes de relaxação
dt1 = 0.000001;                         % intervalo de tempo entre os pontos
E11 = [exp(-dt1/T2) 0 0; 0 exp(-dt1/T2) 0; 0 0 exp(-dt1/T1)];
E21 = [0; 0; exp(-dt1/T1) - 1];

dt2 = 0.00001;
E12 = [exp(-dt2/T2) 0 0; 0 exp(-dt2/T2) 0; 0 0 exp(-dt2/T1)];
E22 = [0; 0; exp(-dt2/T1) - 1];



% Matriz da hinogeneidade
%Rh = @(omega) [cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];
########################################################################################################################################
% Sequência de pulsos - Spin locking

% tempo total do experimento
t1 = [0:dt1:0.002];
t2 = [0.002:dt2:0.05];
t=[t1,t2];
% Matriz para armazenar o sinal
M = zeros(3,size(t)(2));


for dw = pontos;
omega = 2*pi*dw*dt1;
Rh = [cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

  % Pulso 90
  m(:,1) = Rx(pi/2)*M0;

  % Pulso em y
  for n = 2:1:size(t1)(2);
    m(:,n) = E11*Rh*Ry(-Y*20*B1*dt1)*m(:,n-1)-E21;
  endfor;

omega = 2*pi*dw*dt2;
Rh = [cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

  % Aquisição do sinal
  for n = size(t1)(2):1:size(t)(2);
    m(:,n) = E12*Rh*m(:,n-1) - E22;
  end;

  P = Lorentziana(dw);
  M = M + P*[m];

  clear m;
end;

% Normalização
;

% Exponencial


% Plot gráfico
figure();                                                                     % Cria multiplas janelas de gráfico
graph = plot(t, M);                                                           % Gráfico
x = xlabel("Tempo"); y = ylabel("Magnetização");                              % Legendas dos eixos
h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");               % Legenda das variaveis
set([x, y, h, gca], "fontsize", 20);                                          % Tamanho das fontes
set(graph, "LineWidth", 2);                                                   % Tamanho das linhas
#xlim([0,1]); ylim([-1,1]);                                                    % Limite dos eixos
title("Matriz");

########################################################################################################################################
% Notas: Por algum motivo é necessário redefinir a matriz "m" apesar de teoricamente os
% valores deveriam se redefinir a cada ciclo, linha: clear m;
% É mais rápido redefinir a matriz Rh a cada ciclo do que utiliza-la como função
% as matrizes Rx e Ry são utilizadas apenas uma vez então não há grande diferença na velocidade
% pi/2 = Y*B1*pw90
