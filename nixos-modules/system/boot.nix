{ pkgs, config, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_zen;
    kernelModules = [
      "btusb"
    ];
    kernelParams = [
      "i915.enable_guc=2"
      "i915.enable_fbc=1"
      "i915.enable_psr=2"
    ];
    extraModulePackages = with config.boot.kernelPackages; [
      amneziawg
    ];
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      timeout = 5;
      efi.canTouchEfiVariables = true;
    };
    initrd = {
      compressor = "zstd";
      compressorArgs = [ "-16" ];
      verbose = false;
      availableKernelModules = [ "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
      kernelModules = [ ];
    };
  };
}
