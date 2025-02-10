{ inputs, ... }: {
  imports = [
    inputs.nix-flatpack.nixosModules.nix-flatpack
  ];

  services = {
    flatpak = {
      enable = false;
      packages = [
        "io.qt.Designer"
      ];
    };
  };
}
