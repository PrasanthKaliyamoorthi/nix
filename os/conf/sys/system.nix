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
  users.users.piero = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # enable sudo
    packages = with pkgs; [
      tree
    ];
    hashedPassword = "$6$hWrbtUY8FdNmVQAk$apvP7wY95ciYCWxeY4ptmQntRK31Uh8/3QLEXPUKxJY8njcnH8agSf8QoIF3aCAz5njunI0g2SSU87QZ9MnF21";
  };

  programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
}
