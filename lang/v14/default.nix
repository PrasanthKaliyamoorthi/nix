let
  pkgs = import <nixpkgs> { config = {}; overlays = []; };
  txt = "Nix!";
  callPackage = pkgs.lib.callPackageWith(pkgs // {inherit txt;});
in
  rec {
    hello = callPackage ./hello.nix {};
    cow   = callPackage ./cow.nix {};
    cow-folks = cow.override { txt = "folks!"; };
    icat  = callPackage ./icat.nix {};
  }
