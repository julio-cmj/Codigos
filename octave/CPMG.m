clear;
% Simulação de spin echo - Método de matriz
#######################################################################################################################################
% Definição dos parametros
B1 = 587 * 10^-6; B0 = 11.7;          % Campos magnéticos B0 e B1 - Tesla
Y = 267.255*10^6;                     % Constante giromagnética -  rad/seg * Tesla
T1 = 0.6; T2 = 0.4;                   % Tempos de relaxação T1 e T2 - segundo
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
dt = 0.001;                         % intervalo de tempo entre os pontos
E1 = [exp(-dt/T2) 0 0; 0 exp(-dt/T2) 0; 0 0 exp(-dt/T1)];
E2 = [0; 0; exp(-dt/T1) - 1];

% Matriz da hinogeneidade
%Rh = @(omega) [cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];
########################################################################################################################################
% Sequência de pulsos - CPMG

% tempo total do experimento
t = [0:dt:2];
% Matriz para armazenar o sinal
M = zeros(3,size(t)(2));

for dw = pontos;
  omega = 2*pi*dw*dt;
  Rh = [cos(omega) sin(omega) 0; -sin(omega) cos(omega) 0; 0 0 1];

  % Pulso 90
  m(:,1) = Rx(Y*B1*pw90)*M0 - E2;
  for n = 2:1:150;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

  % Pulso 180 - 1
  m(:, 150+1) = Ry(Y*B1*2*pw90)*m(:,end) - E2;
  for n = 150+2:1:450;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

    % Pulso 180 - 2
  m(:, 450+1) = Ry(Y*B1*2*pw90)*m(:,end) - E2;
  for n = 450+2:1:750;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

    % Pulso 180 - 3
  m(:, 750+1) = Ry(Y*B1*2*pw90)*m(:,end) - E2;
  for n = 750+2:1:1050;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

    % Pulso 180 - 4
  m(:, 1050+1) = Ry(Y*B1*2*pw90)*m(:,end) - E2;
  for n = 1050+2:1:1350;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

    % Pulso 180 - 5
  m(:, 1350+1) = Ry(Y*B1*2*pw90)*m(:,end) - E2;
  for n = 1350+2:1:2001;
    m(:,n) = E1*Rh*m(:,n-1) - E2;
  end;

  % Soma das isocromatas com peso
  P = Lorentziana(dw);
  M = M + P*[m];

  clear m;
end;

% Normalização
M = M/max(max(M(:,:)));

% Exponencial
e = @(x) exp(-x/T2);

% Plot gráfico
figure();                                                                     % Cria multiplas janelas de gráfico
graph = plot(t, M, t, e(t), "-black");                                        % Gráfico
x = xlabel("Tempo"); y = ylabel("Magnetização");                              % Legendas dos eixos
h = legend({"Mx", "My", "Mz", "e^{-t/T2}"}, "location", "northeastoutside");  % Legenda das variaveis
set([x, y, h, gca], "fontsize", 20);                                          % Tamanho das fontes
set(graph, "LineWidth", 2);                                                   % Tamanho das linhas
#xlim([0,1]); ylim([-1,1]);                                                   % Limite dos eixos
title("Matriz");

########################################################################################################################################
% Notas: Por algum motivo é necessário redefinir a matriz "m" apesar de teoricamente os
% valores deveriam se redefinir a cada ciclo, linha: clear m;
% É mais rápido redefinir a matriz Rh a cada ciclo do que utiliza-la como função
% as matrizes Rx e Ry são utilizadas apenas uma vez então não há grande diferença na velocidade
% pi/2 = Y*B1*pw90
