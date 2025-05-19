{ ... }: {
  programs = {
    zathura = {
      enable = true;
      extraConfig = ''
        set font "Cascadia Mono 12"
      '';
    };
  };
}
