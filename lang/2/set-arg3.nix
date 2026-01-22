let
  f = { a,  b, c ? 1}: a + b - c;
in f { a = 1; b = 3; c = 4;}
