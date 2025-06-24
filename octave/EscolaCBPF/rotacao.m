function f = rotacao(theta, sigma);
  f = expm(-i * theta * sigma/2);
