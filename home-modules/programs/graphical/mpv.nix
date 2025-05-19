{ ... }: {
  programs = {
    mpv = {
      enable = true;
      config = {
        player-operation-mode = "pseudo-gui";
        # osc = "no";
        # border = "no";
      };
    };
  };
}
