{ pkgs, ... }: {
  services = {
    xserver = {
      enable = true;
      desktopManager.gnome = {
        enable = true;
      };
    };
    gnome = {
      sushi.enable = true;
      gnome-settings-daemon.enable = true;
      gnome-keyring.enable = true;
      core-shell.enable = true;
      core-os-services.enable = true;
    };
  };
}
