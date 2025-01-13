{ pkgs, ... }: {
  services = {
    network-manager-applet.enable = false;
  };
}
