{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "sixel";
        source = ./nixlogo.jpg;
        printRemaining = true;
      };
    };
  };
}
