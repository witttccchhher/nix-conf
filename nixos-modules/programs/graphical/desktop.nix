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

    gnome = {
      enable = true;
      gnome-settings-daemon.enable = true;
      gnome-keyring.enable = true;
      core-shell.enable = true;
      core-os-services.enable = true;
      core-developer-tools.enable = true;
      core-apps.enable = true;
    };
  };
}
