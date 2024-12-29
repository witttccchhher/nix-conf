{ pkgs, ... }: {
  services = {
    xserver = {
      enable = false;
    };
  };
}
