## Equação de Bloch - Campo constante, referencial do laboratório
% argumentos = (vetor campo magnético, constante giromagnética, intervalo de tempo, magnetização inicial)
function [t, M] = Bloch(B, Y, intervalo, y0, W, T1, T2);

  function f = dy(t, y);                                                         ## Funçao de Bloch

    #Noreferencial girante temos o campo efetivo (depois a crescentar o B1 quando houver pulse)
    Beff = (B - [0,0,W/Y]);

    Bx = Beff(1); By = Beff(2) ; Bz = Beff(3);                                            ## Divide os vetores campo magnético e magnetização nas componentes xyz
    Mx = y(1); My = y(2);  Mz = y(3);


    %Meq = é a magnetização de equilibrio (Vamos considerar Meq =1 no eixo z)
    Meq =1;
    %% Verifica esse produto vetorial
    f = [Y*(My*Bz - Mz*By) - Mx/T2;                                              ## Equação de Bloch na forma matricial
         Y*(Mz*Bx - Mx*Bz) - My/T2;
         Y*(Mx*By - My*Bx)] - (Mz - Meq)/T1;

  endfunction;
   ## para melhorar a resolução da curva, vamos escolher o tamanho do passo
   ## intervalo/1000
   options = odeset('MaxStep', abs(intervalo(2) - intervalo(1))/2000);

  [t, M] = ode45(@(t, y) dy(t, y), intervalo, y0, options);                               ## Calculo da diferencial

  #figure();                                                                      ## Cria multiplas janelas de gráfico
  #graph = plot(t, M);                                                            ## Gráfico
  #x = xlabel("Tempo(s)");                                                        ## Legendas dos eixos
  #y = ylabel("Magnetização");
  #h = legend({"Mx", "My", "Mz"}, "location", "northeastoutside");                ## Legenda das variaveis
  #omega = text(2*pi/(Y * Bz), 1, "\\Leftarrow \\omega\\circ");                   ## Mostra a frequência de Larmor no gráfico
  #set([omega, x, y, h], "fontsize", 16);                                         ## Tamanho das fontes
  #set(graph, "LineWidth", 2);                                                    ## Tamanho das linhas

endfunction;
