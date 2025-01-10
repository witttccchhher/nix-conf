{ lib, config, ... }: {
  hardware = {
    alsa.enable = true;
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
