{ pkgs, lib, ... }: {
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
      package = pkgs.niri_with_screenshots_fixes;
    };
    nh = {
      enable = true;
      clean = {
        enable = true;
        dates = "weekly";
        extraArgs = "--keep-since 7d";
      };
    };
    fish.enable = false;
    zsh.enable = true;
    nix-ld.enable = true;
    xwayland.enable = lib.mkForce false;
    nm-applet.enable = false;
  };
}
