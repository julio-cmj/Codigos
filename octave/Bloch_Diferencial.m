clear;
% Simulação de spin echo - Método diferencial
########################################################################################################################################
% Definição dos parametros
B1 = 587 * 10^-6; B0 = 11.7;          % Campos magnéticos B0 e B1 - Tesla
Y = 267.255*10^6;                     % Constante giromagnética -  rad/seg * Tesla
T1 = 0.6; T2 = 0.4;                   % Tempos de relaxação T1 e T2 - segundos
pw90 = 10*10^-6;                      % Tempo de rotação de 90 graus - segundos
w = Y*B0;                             % Frequência de ressonância - rad/seg
M0 = [0; 0; 1];                       % Magnetização inicial
########################################################################################################################################
% Distruibuição da hinomogêneidade
#Gausiana = @(x) exp(-0.5.*(x-25).^2/(50)^2);
Lorentziana = @(x) 1./( 1 + ((x - 25).^2).*(2*pi*0.02).^2);

% Hz
pontos = [-100:1:100];
Npontos = size(pontos)(2)       % Número de pontos
########################################################################################################################################
% Equação de Bloch no referencial girante
bloch = @(t,y,phi,B1,dw) Y*cross(y, [B1*cos(phi); B1*sin(phi); B0 - (w - 2*pi*dw)/Y]) - [y(1)/T2; y(2)/T2; (y(3)-1)/T1];
########################################################################################################################################
% Sequência de pulsos - Spin echo

n = 1;
for dw = pontos;

  % Pulso de 90
  tempo = [0, pw90]; phi = 0;
  options = odeset('MaxStep', abs(tempo(2) - tempo(1))/1000);
  [t1, M1] = ode45(@(t,y) bloch(t,y,phi,B1,dw), tempo, M0,options);

  % Relaxação
  tempo = [tempo(end), tempo(end) + 0.15];
  options = odeset('MaxStep', abs(tempo(2) - tempo(1))/1000);
  [t2, M2] = ode45(@(t,y) bloch(t,y,0,0,dw), tempo, M1(end,:),options);

  % Pulso de 180
  tempo = [tempo(end), tempo(end) + 2*pw90]; phi = pi/2;
  options = odeset('MaxStep', abs(tempo(2) - tempo(1))/1000);
  [t3, M3] = ode45(@(t,y) bloch(t,y,phi,B1,dw), tempo, M2(end,:),options);

  % Relaxação
  tempo = [tempo(end), tempo(end) + 0.85];
  options = odeset('MaxStep', abs(tempo(2) - tempo(1))/1000);
  [t4, M4] = ode45(@(t,y) bloch(t,y,0,0,dw), tempo, M3(end,:),options);

  % União das componentes com peso
  P = Lorentziana(dw);
  m{n} = P*[M1;M2;M3;M4];

  % Mostra qual ponto está sendo calculado
  n = n + 1
end

% União das componentes do tempo (tempo total do experimento)
t = [t1;t2;t3;t4];

% Soma das isocromatas
M = m{1, 1};
for k = [2: 1: size(m)(2)];
  M = M + m{1, k};
end

% Normalização
M = M/max(M(2,:));

% Plot gráfico
figure();                                                                     % Cria multiplas janelas de gráfico
graph = plot(t,M);                                                            % Gráfico
x = xlabel("Tempo"); y = ylabel("Magnetização");                              % Legendas dos eixos
h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");               % Legenda das variaveis
set([x, y, h, gca], "fontsize", 20);                                          % Tamanho das fontes
set(graph, "LineWidth", 2);                                                   % Tamanho das linhas
xlim([0,1]); ylim([-1,1]);                                                    % Limite dos eixos
title("Diferencial");
########################################################################################################################################
% Notas: Não da para criar uma matriz para armezenar o sinal pois não é possível saber as dimensões
% das matrizes M1,M2,M3,M4 previamente, linha M = m{1, 1};
% Maxstep de algum modo define o número de pontos que a função ode45 vai calcular se o denominador
% for alto o suficiente, caso contrário não é possível somar as matrizes "m" pois as dimensões variam
% Porém isso deixa o código extramemente lento.
