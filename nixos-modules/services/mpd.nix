{ ... }: {
  services = {
    mpd = {
      enable = false;
      musicDirectory = "/home/som/Music";
      user = "witcher";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "UGREEN HiTune Max 5c"
        }
      '';
    };
  };
  
  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/1000";
  };
}
