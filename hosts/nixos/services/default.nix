{
  services = {
    resolved.enable = true;
    openssh.enable = false;
    printing.enable = true;
    upower.enable = true;
    libinput = {
      enable = true;
      touchpad = {
        tappingButtonMap = "lrm";
        scrollMethod = "edge";
        disableWhileTyping = true;
        accelSpeed = "0.5";
      };
    };
    pptpd.enable = false;
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
