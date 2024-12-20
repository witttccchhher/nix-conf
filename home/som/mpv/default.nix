{ pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      player-operation-mode = "pseudo-gui";
      # osc = "no";
      # border = "no";
    };
  };
  # xdg.configFile."mpv/scripts/modernx.lua".text = builtins.readFile(pkgs.fetchurl {
  #   url = "https://raw.githubusercontent.com/cyl0/ModernX/refs/heads/main/modernx.lua";
  #   hash = "sha256-Vfd6bWu8z7RqB8HzuKctxM9/AHAN7/P4KHQ4IRXGx4Y=";
  # });
}
