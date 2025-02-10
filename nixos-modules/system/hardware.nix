{ lib, config, ... }: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
    };
    
    cpu.intel = {
      updateMicrocode = lib.mkForce config.hardware.enableRedistributableFirmware;
    };
  };
}
