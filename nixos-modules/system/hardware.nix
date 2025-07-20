{ lib, config, ... }:
{
  hardware = {
    bluetooth = {
      enable = true;
      powerOnBoot = true;
      settings = {
        General = {
          Name = "ms7996";
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

  fileSystems = {
    "/" = {
      device = "/dev/disk/by-uuid/2c55066f-9ce0-476d-9416-d8a096a45099";
      fsType = "ext4";
    };
    "/boot" = {
      device = "/dev/disk/by-uuid/2982-825A";
      fsType = "vfat";
      options = [
        "fmask=0077"
        "dmask=0077"
      ];
    };
  };
}
