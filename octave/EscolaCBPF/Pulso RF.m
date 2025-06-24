## Pulso RF
clear;clc;
Y1 = 42.577*10^6; Y2 = 10.708*10^6; Y3 = 40.078*10^6; Y4 = 6.536*10^6; Y5 = 28024.951*10^6;
Bterra = 50*10^-6; Bmagneto = 0.5; Bsupercondutor = 11.7;

Pulso_0  = Bloch2(Bmagneto, Y1, 0,[0, 10^-6], [0, 0, 1]);
Pulso_90 = Bloch2(Bmagneto, Y1, pi/2,[0, 10^-6], [0, 0, 1]);
