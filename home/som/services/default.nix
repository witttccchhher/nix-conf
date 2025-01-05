{ pkgs, ... }: {
  services = {
    swayosd = {
      enable = true;
      package = pkgs.swayosd;
    };
  };
}
