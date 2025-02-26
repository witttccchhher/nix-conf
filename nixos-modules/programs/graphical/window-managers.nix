{ inputs, pkgs, ... }: {
  nixpkgs.overlays = [
    inputs.niri.overlays.niri
  ];
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [ foot gtklock autotiling ];
    };
    labwc = {
      enable = false;
    };
    niri = {
      enable = true;
      package = pkgs.niri-unstable;
    };
  };
}
