let
  m={a.b.a=4; a.b.c=5; a.c=5;};
  hi="hello";
  di = {a.b=7; a.c=8;};
in 
  with di;
  rec{
    inherit m;
    l=[1 2 3 4 5];
    x=2;
    y=x+5;
    h=hi;
    hii= "${hi} there";
    aa = m.a.b.a;
    ab=a.b;
    inherit di hi;
    inherit a;
    inherit (a) b c;
  }
