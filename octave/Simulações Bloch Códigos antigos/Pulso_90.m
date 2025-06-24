clear;
## Simulação de spin echo

% Definição das constanes
B1 = 587 * 10^-6; phi = 0;
T1 = 0.6; T2 = 0.4; pw90 = 10*10^-6;
B0 = 11.7;

x = [-100:1:100];
size(x)(2)
% Calculo para cada isocromata
n = 1;
for oq = [-10:1:10];
  % pulso de 90
  tempo = [0, pw90];
  [t1, M1] = Bloch(phi, T1, T2, B1, B0, oq, tempo, [0, 0, 1]);
  % relaxação
  tempo = [tempo(end), 0.15];
  [t2, M2] = Bloch(phi, T1, T2, 0, B0, oq, tempo, M1(end, :));

 tempo = [tempo(end), tempo(end) + 2*pw90];
  [t3, M3] = Bloch(pi/2, T1, T2, B1, B0, oq, tempo, M2(end,:));

  tempo = [tempo(end), tempo(end) + 0.85];
  [t4, M4] = Bloch(phi, T1, T2, 0, B0, oq, tempo, M3(end, :));

  G = normal(oq);

  M{n} = G*[M1;M2;M3;M4];

  n = n + 1
end

m = M{1, 1};
for m = [2: 1: size(M)(2)];
  m = m + M{1, m};
end

m = m/size(m)(2);
t = [t1;t2;t3;t4];

% Plot gráfico
figure();                                                                     % Cria multiplas janelas de gráfico
graph = plot(t, m);                                                           % Gráfico
x = xlabel("Tempo");                                                          % Legendas dos eixos
y = ylabel("Magnetização");
h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");               % Legenda das variaveis
set([x, y, h], "fontsize", 16);                                               % Tamanho das fontes
set(graph, "LineWidth", 2);                                                   % Tamanho das linhas
xlim([0,1])
