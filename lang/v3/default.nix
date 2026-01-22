let 
  a = {
    x = "Nix";
    y = "Neovim";
    z = <nixpkgs>;
    s = <nixpkgs/lib>;
    t = '' this is
    indented lines
      .'';
  };
in with a;
  { a1 = ./${"hello ${x} and ${y}. echo \${#SHELL}i;"}/done;
    b1 = z;
    c1 = s;
    d1 = t;
}
