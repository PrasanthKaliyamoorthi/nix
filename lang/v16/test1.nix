let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/release-23.11";
  pkgs = import nixpkgs {};

  test = pkgs.writeText "test1.c" ''
    #include <stdio.h>

    int main(int argc, char* argv[]) {
      printf("this from test1.\n");

      return 0;
    }
  '';

  crossCompileFor = hostPkgs:
    pkgs.runCommandCC "test-cross-test2" {} ''
      HOME=$PWD
      $CC ${test} -o test
      mkdir $out
      ${hostPkgs.stdenv.hostPlatform.emulator hostPkgs.buildPackages} test >$out/txt
      cat $out/txt
      cp test $out
    '';
in {
  win = crossCompileFor pkgs.pkgsCross.mingwW64;
}
