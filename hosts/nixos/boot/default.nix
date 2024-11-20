{ lib, pkgs, ... }: {
  boot = {
    loader.timeout = 0;
    kernelPackages = pkgs.linuxPackages_zen;
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
