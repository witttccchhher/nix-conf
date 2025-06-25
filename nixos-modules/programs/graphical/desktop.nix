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
      settings = {
        daemon = {
          AutomaticLoginEnable = true;
          AutomaticLogin = "witcher";
        };
      };
    };

    udev.packages = with pkgs; [
      gnome-settings-daemon
    ];
  };
}
