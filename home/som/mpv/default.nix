{
  programs.mpv = {
    enable = true;
    config = {
      player-operation-mode = "pseudo-gui";
      osc = "no";
      border = "no";
    };
  };
  xdg.configFile."mpv/scripts/modernx.lua".text = builtins.fetchurl {
    url = "https://github.com/cyl0/ModernX/blob/main/modernx.lua";
    hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };
}
