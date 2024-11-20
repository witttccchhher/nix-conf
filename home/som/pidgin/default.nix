{ pkgs }: {
  programs.pidgin = {
    enable = true;
    plugins = with pkgs; [
      tdlib-purple
      purple-matrix
      purple-discord
    ];
  };
}
