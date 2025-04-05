{ lib, config, ... }: {
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = false;
      settings = {
        General = {
          Experimental = true;
          Enable = "Source,Sink,Media,Socket";
        };
      };
    };
    
    cpu.intel = {
      updateMicrocode = lib.mkForce config.hardware.enableRedistributableFirmware;
    };

    intel-gpu-tools.enable = true;

    graphics = {
      enable = true;
      enable32Bit = true;
    };
  };
}
