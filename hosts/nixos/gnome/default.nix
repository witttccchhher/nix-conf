{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      windowManager.awesome = {
        enable = true;
      };
    };
    displayManager.ly = {
      enable = true;
    };
  };
}
