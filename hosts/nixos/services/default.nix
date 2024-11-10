{
  services = {
    openssh.enable = false;
    printing.enable = true;
    libinput.enable = true;
    pptpd.enable = true;
    openvpn = {
      servers = {
        homeVPN = { config = '' config /home/som/Documents/VPN/Turkey_freeopenvpn_udp.ovpn ''; };
      };
    };
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
