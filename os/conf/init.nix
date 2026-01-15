{ lib, pkgs, ... }:

{
  imports = [
    ./sys/system.nix
    ./home/home.nix
    ./home/manager.nix
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
