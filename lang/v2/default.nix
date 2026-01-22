let
  b = a + 4;
  a = 1;
  c = 23;
  d = {x=1;y={z=6;};};
in
 let s = { inherit d;
  l = with d; [ a b c (a+c) d x y];
};
in s
