with import <nixpkgs> { config = {}; overlays = []; };
  callPackage ./hello.nix {}
