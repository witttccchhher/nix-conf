{ lib, config, ... }: {
  hardware = {
    alsa = {
      enable = true;
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
      enable = false;
      powerOnBoot = false;
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
