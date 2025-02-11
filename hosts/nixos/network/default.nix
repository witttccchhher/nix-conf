{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    dhcpcd.enable = true;
  };
}
