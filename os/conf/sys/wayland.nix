{ pkgs, config, ... }: {
  # Enable Hyprland
  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  # Configure keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Exclude default X11 packages
  services.xserver.excludePackages = with pkgs; [ xterm ];
}