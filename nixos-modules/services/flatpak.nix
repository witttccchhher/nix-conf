{ inputs, ... }:
{
  imports = [
    inputs.nix-flatpak.nixosModules.nix-flatpak
  ];

  services = {
    flatpak = {
      enable = false;
      packages = [ ];
    };
  };
}
