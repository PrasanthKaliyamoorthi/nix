let
  pkgs = import <nixpkgs> {};
  int = import ./test.nix 44 33;
  str = import ./str.nix "this from default.nix";
  str1 = import ./str1.nix { pkgs= import <nixpkgs> {}; str="THIS FROM DEFAULT.NIX";};
in
  [ int str str1 ]
