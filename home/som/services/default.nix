{ pkgs, ... }: {
  services = {
    network-manager-applet.enable = false;
    swayosd = {
      enable = false;
      package = pkgs.swayosd;
    };
  };
}
