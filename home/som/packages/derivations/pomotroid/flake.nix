{
  description = "Flake for build Pomotroid";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    { flake-parts, ... }@inputs:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem =
        { self', pkgs, ... }:
        {
          packages.pomotroid = pkgs.callPackage ./pomotroid.nix { };
          packages.default = self'.packages.pomotroid;
        };
    };
}
