{ ... }: {
  programs = {
    lazygit = {
      enable = true;
      settings = {
        gui = {
          mouseEvents = false;
          theme = {
            activeBorderColor = [ "magenta" "bold" ];
            inactiveBorderColor = [ "default" ];
          };
        };
      };
    };
  };
}
