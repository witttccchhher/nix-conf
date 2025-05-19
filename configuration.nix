{ modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    ./nixos-modules
  ];

  nixpkgs.hostPlatform = "x86_64-linux";
  system.stateVersion = "25.05";
}
