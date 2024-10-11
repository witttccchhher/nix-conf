{
  programs.nh = {
    enable = true;
    flake = /home/som/nix;
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep-since 7d";
    };
  };
}
