{ lib, config, ... }: {
  hardware = {
    alsa.enablePersistence = true;
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
    algorithm = "lz4";
  };
}
