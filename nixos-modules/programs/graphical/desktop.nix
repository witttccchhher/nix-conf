{ pkgs, inputs, ... }: {
  imports = [ inputs.niri.nixosModules.niri ];

  programs.niri = {
    enable = false;
    package = inputs.niri.packages.${pkgs.system}.niri-unstable;
  };

  services = {
    desktopManager.gnome.enable = true;
    displayManager.gdm = {
      enable = true;
      autoSuspend = false;
    };

    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];
  };
}
