{ lib, ... }: {
  services = {
    resolved.enable = true;
    openssh.enable = true;
    printing.enable = false;
    upower.enable = true;
    libinput.enable = true;
    pptpd.enable = false;
    pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      audio.enable = true;
    };
    flatpak = {
      enable = false;
      packages = [
        "io.qt.Designer"
      ];
    };
    mpd = {
      enable = true;
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
