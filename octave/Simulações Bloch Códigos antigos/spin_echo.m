clear;
% Simulação de spin echo

#############################################################################
% Definição das constanes
B1 = 587 * 10^-6; B0 = 11.7;          % Campos magnéticos B0 e B1 - Tesla
Y = -267.255*10^6;                    % Constante giromagnética -  rad/seg * Tesla
T1 = 0.6; T2 = 0.4;                   % Tempos de relaxação T1 e T2 - segundos
pw90 = 10*10^-6;                      % Tempo de rotação de 90 graus - segundos
w = Y*B0;                             % Frequência de ressonância - rad/seg
M0 = [0; 0; 1];                         % Magnetização inicial
###############################################################################
% Distruibuição da hinomogêneidade

gausiana = @(x) 20.*exp(-0.5.*(x-25).^2/(35)^2);
hinogeneidade = [-100:1:100];                           %
size(hinogeneidade)(2)                                  % Número de pontos

################################################################################
% Método diferencial

bloch = @(t,y,phi,B1,dw) cross(y, Y*[B1*cos(phi); B1*sin(phi); (B0 - (w + 2*pi*dw)/Y)]) - [y(1)/T2; y(2)/T(2); (y(3)-1)/T1];

%Calculo para cada isocromata
n = 1;
for dw = hinogeneidade;
  % Pulso de 90
  tempo = [0, pw90]; phi = 0;
  [t1, M1] = ode45(@(t,y) bloch(t,y,phi,B1,dw), tempo, M0);
  % Relaxação
  tempo = [tempo(end), tempo(end)+ 0.15];
  [t2, M2] = ode45(@(t,y) bloch(t,y,phi,0,dw), tempo, M1(end,:));
  % Pulso de 180
  tempo = [tempo(end), tempo(end) + 2*pw90]; phi = pi/2;
  [t3, M3] = ode45(@(t,y) bloch(t,y,phi,B1,dw), tempo, M2(end,:));
  % Relaxação
  tempo = [tempo(end), tempo(end) + 0.85];
  [t4, M4] = ode45(@(t,y) bloch(t,y,phi,0,dw), tempo, M3(end,:));

  % Peso
  G = gausiana(dw);
  %
  M{n} = G*[M1;M2;M3;M4];

  % mostra qual ponto está sendo calculado
  n = n + 1
end

% soma das isocromatas
t = [t1;t2;t3;t4];
m = M{1, 1};                % Não da pra criar uma matriz nula pq a dimensão da matriz varia dependendo da distribuição - size(M{1,1})
for l = [2: 1: size(M)(2)];
  m = m + M{1, l}/2;
end



% Plot gráfico
figure();                                                                     % Cria multiplas janelas de gráfico
graph = plot(t, M);                                                           % Gráfico
x = xlabel("Tempo");                                                          % Legendas dos eixos
y = ylabel("Magnetização");
h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");               % Legenda das variaveis
set([x, y, h], "fontsize", 16);                                               % Tamanho das fontes
set(graph, "LineWidth", 2);                                                   % Tamanho das linhas
