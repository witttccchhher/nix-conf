{ ... }: {
  programs.bat = {
    enable = true;
    themes = {
      next = {
        file = ./next.tmTheme;
      };
    };
  };
}
