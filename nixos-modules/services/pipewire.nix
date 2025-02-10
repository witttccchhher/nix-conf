{ lib, ... }: {
  services = {
    pipewire = {
      enable = lib.mkForce true;
      alsa.enable = true;
      audio.enable = true;
    };
  };
}
