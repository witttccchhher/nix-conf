{
  services = {
    resolved.enable = true;
    openssh.enable = false;
    printing.enable = false;
    upower.enable = true;
    libinput.enable = true;
    pptpd.enable = false;
    pipewire = {
      enable = true;
      alsa.enable = true;
      audio.enable = false;
    };
    flatpak = {
      enable = false;
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
