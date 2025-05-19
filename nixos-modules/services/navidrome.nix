{ ... }:
{
  services.tailscale.enable = true;
  services.navidrome = {
    enable = true;
    settings = {
      Port = 7777;
      Address = "0.0.0.0";
      MusicFolder = "/var/music";
      Scanner.Shedule = "@every 1h";
    };
  };
}
