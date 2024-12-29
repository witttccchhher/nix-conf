{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      desktopManager.awesome = {
        enable = true;
      };
    };
    displayManager.ly = {
      enable = true;
    };
  };
}
