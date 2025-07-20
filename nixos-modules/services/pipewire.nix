{ lib, ... }:
{
  services = {
    pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      alsa.support32Bit = true;
      audio.enable = true;
    };
  };
}
