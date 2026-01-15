{ lib, pkgs, ... }:

{
  imports = [
    ./sys/system.nix
  ];

  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
  };
}
