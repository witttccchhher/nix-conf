{ ... }: {
  networking = {
    hostName = "nixos";

    networkmanager.enable = true;

    useDHCP = true;
    dhcpcd.enable = true;
  };
}
