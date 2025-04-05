{ pkgs, ... }: {
  programs = {
    sway = {
      enable = false;
      extraPackages = with pkgs; [ autotiling ];
    };
    labwc = {
      enable = false;
    };
    niri = {
      enable = false;
      package = pkgs.niri-unstable;
    };
    hyprland = {
      enable = false;
    };
  };
}
