{ pkgs, ... }: {
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [ autotiling ];
    };
    labwc = {
      enable = false;
    };
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
    hyprland = {
      enable = false;
    };
  };
}
