{ pkgs, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
}
