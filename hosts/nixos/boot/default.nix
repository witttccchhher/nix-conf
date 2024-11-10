{ lib, pkgs, ... }: {
  boot = {
    plymouth = {
      enable = true;
      logo = pkgs.fetchurl {
        url = "https://nixos.org/logo/nixos-hires.png";
        sha256 = "1ivzgd7iz0i06y36p8m5w48fd8pjqwxhdaavc0pxs7w1g7mcy5si";
      };
    };
    consoleLogLevel = 0;
    initrd.verbose = false;
    kernelParams = [
      "quiet"
      "splash"
      "plymouth:debug"
    ];
    loader.timeout = 0;
    kernelPackages = pkgs.linuxPackages_zen;
    loader.grub = {
      enable = true;
      device = "/dev/sda";
      useOSProber = false;
    };
  };
  environment.etc."plymouth/plymouthd.conf".text = lib.mkForce ''
    [Daemon]
    ShowDelay=10
    DeviceTimeout=10
    Theme=bgrt
  '';
}
