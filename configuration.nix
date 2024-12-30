{ ... }: {
  imports = [
    ./hardware-configuration.nix
    ./hosts/nixos
  ];

  system.stateVersion = "24.05";
}
