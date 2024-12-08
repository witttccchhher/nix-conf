{ lib, pkgs, config, ... }: {
  boot = {
    # loader.timeout = 0;
    kernelPackages = pkgs.linuxPackages_zen;
    extraModulePackages = with config.boot.kernelPackages; [ amneziawg ];
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
