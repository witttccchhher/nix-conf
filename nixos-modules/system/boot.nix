{ pkgs, config, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [
      "btusb"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      amneziawg
    ];
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
    initrd = {
      availableKernelModules = [ "ehci_pci" "ahci" "ums_realtek" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
  };
}
