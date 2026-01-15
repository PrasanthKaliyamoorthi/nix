{ config, lib, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    vim
    wget
    neovim
    kitty
    btop
    git
  ];
}
