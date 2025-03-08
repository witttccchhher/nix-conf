{ pkgs, ... }: {
  programs = {
    gamescope.enable = true;
    gamemode.enable = true;
    steam = {
      enable = true;
      gamescopeSession = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
