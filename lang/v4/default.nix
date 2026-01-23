let
  f = { a, b, c ? 0, ...}: a + b - c;
  end = "this end of list";
  curried = x: y: x + y;
in
  [ "this list calls function f" (f { a=2; b=3; }) " & calling curried function " (curried 3 5) end ]
