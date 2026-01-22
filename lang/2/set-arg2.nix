let
  f = { a,  b, ...}: a + b;
in f { a = 1; b = 3; c = 4;}
