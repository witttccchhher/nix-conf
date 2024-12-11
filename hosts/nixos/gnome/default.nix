{ pkgs, ... }: {
  services = {
    xserver = {
      enable = false;
      desktopManager.gnome = {
        enable = false;
      };
    };
    gnome = {
      sushi.enable = false;
      gnome-settings-daemon.enable = false;
      gnome-keyring.enable = false;
      core-shell.enable = false;
      core-os-services.enable = false;
    };
  };
}
