let
  pkgs = import <nixpkgs> {};
in
  str: pkgs.lib.strings.toUpper str
