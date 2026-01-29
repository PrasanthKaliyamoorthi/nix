let
  nixpkgs = <nixpkgs>;   #fetchTarball "url";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      cowsay
      lolcat
    ];
    GREETING = ''Hello, Nix!'';

    shellHook = ''echo $GREETING | cowsay | lolcat'';
  }
