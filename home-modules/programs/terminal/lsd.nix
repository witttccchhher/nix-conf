{ ... }: {
  programs = {
    lsd = {
      enable = true;
      enableAliases = false;
      settings = {
        layout = "grid";
        icons = {
          when = "always";
          theme = "fancy";
          separator = "  ";
        };
      };
    };
  };
}
