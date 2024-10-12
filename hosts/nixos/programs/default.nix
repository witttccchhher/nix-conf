{ pkgs, ... }: {
  programs = {
    sway = {
      enable = true;
      extraPackages = with pkgs; [ foot gtklock sov autotiling ];
    };
    fish.enable = true;
    zsh.enable = true;
  };

  security.pam.services.gtklock.text = pkgs.lib.readFile "${pkgs.gtklock}/etc/pam.d/gtklock";
}
