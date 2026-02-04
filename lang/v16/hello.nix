let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
  pkgs = import nixpkgs {};

  hello = pkgs.writeText "hello.c" ''
    #include <stdio.h>

    int main(int argc, char* argv[]) {
      printf("Hello, World!\n");

      return 0;
    }
  '';

  crossCompileFor = hostPkgs:
    hostPkgs.runCommandCC "hello-corss-test" {} ''
      HOME=$PWD
      $CC ${hello} -o hello
      ${hostPkgs.stdenv.hostPlatform.emulator hostPkgs.buildPackages} hello >$out
      cat $out
    '';
in {
  rpi = crossCompileFor pkgs.pkgsCross.raspberryPi;
  win = crossCompileFor pkgs.pkgsCross.mingwW64;
}
