{ pkgs ? import <nixpkgs> {} }:
let
  msg = "the cow says hello!";
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [ cowsay ];
    shellHook = ''
      cowsay ${msg}
    '';
  }
