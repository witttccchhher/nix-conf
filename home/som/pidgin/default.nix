{ pkgs, ... }: {
  programs.pidgin = {
    enable = true;
    package = pkgs.pidgin;
    plugins = with pkgs.pidginPackages; [
      purple-matrix
      purple-discord
    ];
  };
}
