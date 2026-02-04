let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
  pkgs = (import nixpkgs {}).pkgsCross.raspberryPi;
in
  pkgs.pkgsStatic.callPackage ({mkShell, zlib, pkg-config, file}:
    mkShell {
      nativeBuildInputs = [ pkg-config file ];
      buildInputs = [zlib];
    }
  ) {}
