{ pkgs, ... }:
{
  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  users = {
    defaultUserShell = pkgs.zsh;
    users.witcher = {
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "input"
        "networkmanager"
        "video"
        "audio"
        "docker"
      ];
      packages = [ ];
      useDefaultShell = true;
      shell = pkgs.zsh;
    };
  };

  # services.xserver.displayManager.gdm = {
  #   enable = true;
  #   wayland = true;
  # };

  services.greetd = {
    enable = true;
    package = pkgs.greetd.tuigreet;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --cmd Hyprland";
      };
    };
    vt = 1;
  };

  # services.getty.autologinUser = "witcher";
  # environment.loginShellInit = ''
  #   [[ "$(tty)" == /dev/tty1 ]] && niri-session
  # '';
}
