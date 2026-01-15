{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vim
    wget
    neovim
    kitty
    btop
    git
  ];
}
