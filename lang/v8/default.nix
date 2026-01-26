let
  pkgs = import <nixpkgs> {};
  cowsay = import ./cow.nix {};
in
  ["${pkgs.nix}" cowsay]
