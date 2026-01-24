let
  f = { a ? 1, b ? 2, c ? 0,...}@arg: a + b - c;
in
  f { a =  2; b = 4; d = 3; z = [ 1 2 3 ]; }
