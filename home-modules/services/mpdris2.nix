{ config, ... }: {
  services.mpdris2 = {
    enable = false;
    mpd = {
      host = "127.0.0.1";
      port = 6600;
      musicDirectory = "${config.home.homeDirectory}/Music";
    };
    multimediaKeys = false;
    notifications = false;
  };
}
