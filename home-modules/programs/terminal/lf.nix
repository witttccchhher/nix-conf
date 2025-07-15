{ ... }: {
  programs.lf = {
    enable = true;

    settings = {
      anchorfind = false;
      globsearch = true;
      hidden = true;
      number = true;
    };
  };
}
