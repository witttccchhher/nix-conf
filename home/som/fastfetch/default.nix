{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "sixel";
        source = ./nixlogo.png;
        printRemaining = true;
      };
    };
  };
}
