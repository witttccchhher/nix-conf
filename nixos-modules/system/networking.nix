{ lib, ... }: {
  networking = {
    hostName = "nixos";

    networkmanager.enable = true;

    useDHCP = lib.mkForce true;
    dhcpcd.enable = true;
  };
}
