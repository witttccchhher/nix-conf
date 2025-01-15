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
      enable = false;
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
