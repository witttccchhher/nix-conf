{ lib, config, ... }: {
  hardware = {
    alsa = {
      enable = false;
      config = ''
        pcm.!default {
          type hw
          card 0
        }

        ctl.!default {
          type hw
          card 0
        }
      '';
    };
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    
    cpu.intel = {
      updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };
}
