## Equação de Bloch - referencial do laboratório
## De preferência usar apenas para o campo constante

% argumentos:
% B = campo magnético(vetor)| T1,T2 = tempos de relaxação |gamma = Constante giromagnética |
% intervalo = intervalo de tempo que o campo é aplicado [Ti, Tf] | M0 = magnetização inicial(vetor)
function [t, M] = Bloch_lab(B, gamma, T1, T2, intervalo, M0);

  Meq = 1;

% definição da função de Bloch
  function f = dy(t, y);

% Divide os vetores campo magnético e magnetização nas componentes xyz
    Bx = B(1); By = B(2); Bz = B(3);
    Mx = y(1); My = y(2); Mz = y(3);

% Equação de Bloch na forma matricial
% gamma*(MxB) - [Mx/T2; My/T2; (Mz - Meq)/T1]
    f = [gamma*(My*Bz - Mz*By) - Mx/T2;
         gamma*(Mz*Bx - Mx*Bz) - My/T2;
         gamma*(Mx*By - My*Bx) - (Mz - Meq)/T1];
  end;

% para melhorar a resolução da curva, vamos escolher o tamanho do passo
% intervalo/1000
   options = odeset('MaxStep', abs(intervalo(2) - intervalo(1))/2000);

% Calculo da diferencial
  [t, M] = ode45(@(t, y) dy(t, y), intervalo, M0, options);

% Plot da magnetização em função do tempo
  figure();                                                                      ## Cria multiplas janelas de gráfico
  graph = plot(t, M);                                                            ## Gráfico
  x = xlabel("Tempo");                                                           ## Legendas dos eixos
  y = ylabel("Magnetização");
  h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");                ## Legenda das variaveis
##omega = text(2*pi/(gamma * Bz), 1, "\\Leftarrow \\omega");                         ## Mostra a frequência de Larmor no gráfico
  set([x, y, h], "fontsize", 18);                                         ## Tamanho das fontes
  set(graph, "LineWidth", 2);                                                    ## Tamanho das linhas

end;
