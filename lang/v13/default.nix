let
  pkgs = import <nixpkgs> { };
in
pkgs.lib.fix (self: 
  let
    callPackage = pkgs.lib.callPackageWith (pkgs // self);
    packages = rec {
      a = callPackage ./a.nix { };
      b = callPackage ./b.nix { };
      hello = callPackage ./hello.nix { audience = packages.a; };
      hello-folks = hello.override { audience = packages.b; };
    };
  in
    packages
)
