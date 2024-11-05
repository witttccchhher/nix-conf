{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = { self, flake-parts, ... }@inputs: flake-parts.lib.mkFlake { inherit inputs; } {
    imports = [ flake-parts.flakeModules.easyOverlay ];
    systems = [ "x86_64-linux" ];

    perSystem = { self', config, pkgs, ... }: let inherit (pkgs) callPackage; in {
      packages = {
        default = self'.packages.llwit;
        llwit = callPackage ./llwit.nix { };
      };
    };
  };
}
