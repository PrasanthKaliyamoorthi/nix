let
  f = { a,  b, ...}@args: a + b - args.c;
in f { a = 1; b = 3; c = 4;}
