{ pkgs, ... }: {
  programs.mpv = {
    enable = true;
    config = {
      player-operation-mode = "pseudo-gui";
      osc = "no";
      border = "no";
    };
  };
  xdg.configFile."mpv/scripts/modernx.lua".text = builtins.readFile(pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/cyl0/ModernX/refs/heads/main/modernx.lua";
    hash = "";
  });
}
