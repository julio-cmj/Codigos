function f = rotacaoz(theta);
  sigma_x = [0 1 ; 1 0];
  sigma_y = [0 -i; i 0];
   f = rotacao(pi/2, sigma_x) * rotacao(theta,sigma_y) * rotacao(-pi/2, sigma_x);
