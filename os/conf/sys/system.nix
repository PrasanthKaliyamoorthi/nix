{ config, lib, pkgs, ... }:

{
  imports = 
    [
      ./sysPkgs.nix
      ./services.nix
    ];

  # hostname
  networking.hostName = "nixos";

  # enable networking
  networking.networkmanager.enable = true;
  
  # time zone
  time.timeZone = "Asia/Kolkata";
  
  # user account.
  users.users.nix = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # enable sudo
    packages = with pkgs; [
      tree
    ];
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
