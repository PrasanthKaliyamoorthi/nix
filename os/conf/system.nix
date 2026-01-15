{ config, lib, pkgs, ... };

{
  imports = 
    [
      ./sysPkgs.nix
    ];

  # hostname
  networking.hostName = "nixos";
  
  # time zone
  time.timeZone = "Aisa/Kolkata";
  
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
