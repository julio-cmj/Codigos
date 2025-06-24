function U = evolucao(t, E);
  U = expm(-i * E * t);
