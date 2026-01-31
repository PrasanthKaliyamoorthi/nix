let
  pkgs = import <nixpkgs> { config = {}; overlays = [];};
in
{
  hello = pkgs.callPackage ./hello.nix {};
  icat = pkgs.callPackage ./icat.nix {};
}
