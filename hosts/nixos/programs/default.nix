{ pkgs, ... }: {
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [ foot gtklock autotiling ];
    };
    river = {
      enable = true;
      extraPackages = with pkgs; [ foot ];
      xwayland.enable = true;
    };
    fish.enable = false;
    zsh.enable = true;
    nix-ld.enable = true;
  };

  security.pam.services.gtklock.text = pkgs.lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
}
