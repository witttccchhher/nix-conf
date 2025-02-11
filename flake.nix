{
  description = "Mystery place, full of flakes";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nur.url = "github:nix-community/NUR";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    stylix.url = "github:danth/stylix";
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    dooit.url = "github:dooit-org/dooit";
    dooit-extras.url = "github:dooit-org/dooit-extras";
    witpkgs.url = "github:witttccchhher/witpkgs";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-cursors = {
      url = "github:LilleAila/nix-cursors";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wallpapers = {
      url = "github:witttccchhher/wallpapers";
      flake = false;
    };
    nypkgs = {
      url = "github:yunfachi/nypkgs";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    fzf-tab = {
      url = "github:Aloxaf/fzf-tab";
      flake = false;
    };
    base16 = {
      url = "github:witttccchhher/base16";
      flake = false;
    };
  };

  outputs =
    { self, ... }@inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      flake =
        let
          system = "x86_64-linux";
          pkgs-master = import inputs.nixpkgs-master { inherit system; };
          w = import ./wlib { inherit inputs; };
        in
        {
          nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
            specialArgs = { inherit inputs system w; };
            modules = [
              ./configuration.nix
            ];
          };

          homeConfigurations.som = inputs.home-manager.lib.homeManagerConfiguration {
            pkgs = inputs.nixpkgs.legacyPackages.${system};
            extraSpecialArgs = { inherit inputs system w; };
            modules = [
              ./home.nix
            ];
          };
        };
      systems = [ "x86_64-linux" ];
    };
}
