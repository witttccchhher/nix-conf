{ pkgs, ... }: {
  services = {
    swayosd = {
      enable = false;
      package = pkgs.swayosd;
    };
  };
}
