{ pkgs, ... }: {
  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  users = {
    defaultUserShell = pkgs.zsh;
    users.som = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" "video" "audio" ];
      packages = [];
      useDefaultShell = true;
      shell = pkgs.zsh;
    };
  };

  services.greetd = {
    enable = true;
    package = pkgs.greetd.tuigreet;
    vt = 1;
  };

  # services.getty.autologinUser = "som";
  # environment.loginShellInit = ''
  #   [[ "$(tty)" == /dev/tty1 ]] && niri-session
  # '';
}
