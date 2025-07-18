{ ... }: {
  programs.bat = {
    enable = true;
    themes = {
      next = builtins.readFile ./next.tmTheme;
    };
  };
}
