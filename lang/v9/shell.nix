let
  nixpkgs = <nixpkgs>; #featchTarball "git url";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in
  pkgs.mkShellNoCC {
    packages = with pkgs; [
      cowsay
      lolcat
      sl
    ];

    GREETINGS = ''Hello, Nix!
      Grate Power comes with Grate Responsiblyties.
    '';
    shellHook = ''
      echo $GREETINGS |cowsay |lolcat
    '';
  }
