## Equação de Bloch - Referencial girante
% Argumentos
% phi = Diferença de fase campo variavel |B1 = Módulo pulso |B0 = módulo campo constante
% tempo = intervalo de tempo [Ti, Tf] |M0 = Magnetização inicial
function [t, M] = Bloch(phi, T1, T2, B1, B0, oq, tempo, M0);

##B0 = 11.7;          # T
  Y = -267.255*10^6;  # rad/(s*T)
  w = Y*B0 + 2*pi*oq;

% Campo efetivo
  Beff = [B1*cos(phi) B1*sin(phi) (B0 - w/Y)];

% Equação de Bloch no refencial girante
% M = matriz magnetização, R = matriz relaxação
  function f = dy(t, y);
    Mx = y(1); My = y(2); Mz = y(3);
    M = [Mx; My; Mz];

    A = [    0       -Y*Beff(3)   Y*Beff(2);
           Y*Beff(3)       0     -Y*Beff(1);
          -Y*Beff(2)  Y*Beff(1)      0    ];

    R = [Mx/T2; My/T2; (Mz-1)/T1];
    f =  A * M - R;

  endfunction;

% Cálculo da diferencial
  options = odeset('MaxStep', abs(tempo(2) - tempo(1))/2000);
  [t, M] = ode45(@(t, y) dy(t, y), tempo, M0, options);

% Plot gráfico
##  figure();                                                                     % Cria multiplas janelas de gráfico
##  graph = plot(t, M);                                                           % Gráfico
##  x = xlabel("Tempo");                                                          % Legendas dos eixos
##  y = ylabel("Magnetização");
##  h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");               % Legenda das variaveis
##  set([x, y, h], "fontsize", 16);                                               % Tamanho das fontes
##  set(graph, "LineWidth", 2);                                                   % Tamanho das linhas

endfunction;
