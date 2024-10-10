{
  imports = [ ./zapret.nix ];

  services = {
    openssh.enable = false;
    printing.enable = true;
    libinput.enable = true;
    flatpak = {
      enable = true;
      packages = [
        "io.qt.Designer"
      ];
    };
    mpd = {
      enable = false;
      musicDirectory = "/home/som/Music";
      user = "som";
      network.listenAddress = "any";
      startWhenNeeded = true;
    };
  };
  
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
