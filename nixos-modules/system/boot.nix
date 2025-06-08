{ pkgs, config, ... }: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelModules = [
      "btusb"
      "kvm-intel"
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
      grub = {
        devices = [ "nodev" ];
        efiSupport = true;
        efiInstallAsRemovable = true;
        enable = true;
        extraEntries = ''
          menuentry "Windows" {
            insmod part_gpt
            insmod fat
            insmod search_fs_uuid
            insmod chain
            search --fs-uuid --set=root E517-9C2E
            chainloader /EFI/Microsoft/Boot/bootmgfw.efi
          }
        '';
      };
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
