{ pkgs, ... }: {
  time.timeZone = "Asia/Yekaterinburg";
  i18n.defaultLocale = "en_US.UTF-8";
  users = {
    defaultUserShell = pkgs.fish;
    users.wtchr = {
      isNormalUser = true;
      extraGroups = [ "wheel" "input" "networkmanager" "video" "audio" ];
      packages = [];
      useDefaultShell = true;
      shell = pkgs.fish;
    };
  };

  services.getty.autologinUser = "wtchr";
  environment.loginShellInit = ''
    [[ "$(tty)" == /dev/tty1 ]] && sway
  '';
}
