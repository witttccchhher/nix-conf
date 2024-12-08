{
  programs.mpv = {
    enable = true;
    config = {
      player-operation-mode = "pseudo-gui";
      osc = "no";
      border = "no";
    };
  };
  xdg.configFile."mpv/scripts/modernx.lua".text = builtins.readFile ./modernx.lua;
}
